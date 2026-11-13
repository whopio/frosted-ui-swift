import base64
import hashlib
import importlib.util
import shutil
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest.mock import patch


spec = importlib.util.spec_from_file_location("publish", Path(__file__).parents[2] / "bin/publish_xcframework.py")
publish = importlib.util.module_from_spec(spec)
spec.loader.exec_module(publish)


class PublishTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        self.archive = self.root / "FrostedUI.xcframework.zip"
        self.hosted = self.root / "hosted.zip"
        self.source = "a" * 40
        for archive, payload in [(self.archive, "rebuilt"), (self.hosted, "original")]:
            with zipfile.ZipFile(archive, "w") as bundle:
                bundle.writestr("FrostedUI.xcframework/source-revision.txt", self.source)
                bundle.writestr("build.txt", payload)
        self.mutations = []
        self.existing = False
        self.wrong_parent = False
        self.source_status = "behind"
        self.manifest = publish.manifest("whopio/frosted-ui-swift", "0.9.0", hashlib.sha256(self.hosted.read_bytes()).hexdigest())

    def run_command(self, *args, data=None):
        if args[0] == "git":
            if "status" in args:
                return ""
            return self.source
        if args[:3] == ("gh", "release", "download"):
            shutil.copyfile(self.hosted, Path(args[-1]) / self.archive.name)
            return ""
        self.fail(f"Unexpected command: {args[:3]}")

    def api(self, path, payload=None):
        if payload is not None:
            self.mutations.append((path, payload))
            return {"sha": "generated"}
        if "/releases/tags/" in path:
            return {"draft": False, "prerelease": False, "assets": [{"name": self.archive.name}]}
        if "/compare/" in path:
            return {"status": self.source_status}
        if "/git/matching-refs/" in path:
            return [{"ref": "refs/tags/binary/0.9.0", "object": {"sha": "binary"}}] if self.existing else []
        if "/git/commits/binary" in path:
            return {"parents": [{"sha": "wrong" if self.wrong_parent else self.source}]}
        if "/git/commits/" in path:
            return {"tree": {"sha": "source-tree"}}
        if "/contents/Package.swift" in path:
            return {"content": base64.b64encode(self.manifest.encode()).decode()}
        if "/commits/" in path:
            return {"sha": self.source}
        self.fail(f"Unexpected API request: {path}")

    def publish(self):
        with patch.object(publish, "run", side_effect=self.run_command), patch.object(publish, "api", side_effect=self.api), patch("sys.argv", ["publish", "0.9.0", str(self.archive)]):
            publish.main()

    def test_interrupted_upload_uses_hosted_checksum_and_preserves_source_tree(self):
        self.publish()
        tree = self.mutations[0][1]
        self.assertEqual(tree["base_tree"], "source-tree")
        self.assertEqual(tree["tree"], [{"path": "Package.swift", "mode": "100644", "type": "blob", "content": self.manifest}])
        self.assertEqual(self.mutations[-1][1]["ref"], "refs/tags/binary/0.9.0")

    def test_completed_publication_is_idempotent(self):
        self.existing = True
        self.publish()
        self.assertEqual(self.mutations, [])

    def test_existing_tag_from_other_source_is_not_replaced(self):
        self.existing = True
        self.wrong_parent = True
        with self.assertRaisesRegex(ValueError, "Existing binary tag differs"):
            self.publish()
        self.assertEqual(self.mutations, [])

    def test_source_outside_main_is_rejected_before_upload(self):
        self.source_status = "diverged"
        with self.assertRaisesRegex(ValueError, "must be on main"):
            self.publish()
        self.assertEqual(self.mutations, [])

    def test_archive_from_other_source_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "does not match"):
            publish.validate_archive(self.archive, "b" * 40)


if __name__ == "__main__":
    unittest.main()
