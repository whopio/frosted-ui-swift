#!/usr/bin/env python3
import argparse
import base64
import hashlib
import json
import re
import subprocess
import tempfile
import zipfile
from pathlib import Path


def run(*args, data=None):
    return subprocess.check_output(args, input=data, text=True).strip()


def api(path, payload=None):
    args = ["gh", "api", path]
    if payload is not None:
        args += ["--method", "POST", "--input", "-"]
    return json.loads(run(*args, data=json.dumps(payload) if payload else None))


def manifest(repository, tag, checksum):
    return f'''// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "FrostedUI",
    platforms: [.iOS(.v17), .macOS(.v15)],
    products: [.library(name: "FrostedUI", targets: ["FrostedUI"])],
    targets: [
        .binaryTarget(
            name: "FrostedUI",
            url: "https://github.com/{repository}/releases/download/{tag}/FrostedUI.xcframework.zip",
            checksum: "{checksum}"
        ),
    ]
)
'''


def validate_archive(archive, source):
    with zipfile.ZipFile(archive) as bundle:
        revision = bundle.read("FrostedUI.xcframework/source-revision.txt").decode().strip()
        if revision != source:
            raise ValueError("Archive does not match the source release commit")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("tag")
    parser.add_argument("archive", type=Path)
    parser.add_argument("--repository", default="whopio/frosted-ui-swift")
    parser.add_argument("--prepare-only", type=Path)
    args = parser.parse_args()
    if args.archive.name != "FrostedUI.xcframework.zip":
        parser.error("Expected FrostedUI.xcframework.zip")
    if not re.fullmatch(r"v?\d+\.\d+\.\d+", args.tag):
        parser.error("Expected a stable version tag, such as 0.9.0")
    if not re.fullmatch(r"[\w.-]+/[\w.-]+", args.repository):
        parser.error("Invalid repository")
    root = Path(__file__).resolve().parent.parent
    source = run("git", "-C", str(root), "rev-parse", "HEAD")
    validate_archive(args.archive, source)
    if args.prepare_only:
        checksum = hashlib.sha256(args.archive.read_bytes()).hexdigest()
        args.prepare_only.write_text(manifest(args.repository, args.tag, checksum))
        return

    if run("git", "-C", str(root), "status", "--porcelain", "--untracked-files=no"):
        raise ValueError("Publish from a clean source checkout")

    prefix = f"repos/{args.repository}"
    release = api(f"{prefix}/releases/tags/{args.tag}")
    if release["draft"] or release["prerelease"]:
        raise ValueError("Expected a published stable release")
    tag_commit = api(f"{prefix}/commits/{args.tag}")["sha"]
    if tag_commit != source:
        raise ValueError("Checkout does not match the source release tag")
    if api(f"{prefix}/compare/main...{source}")["status"] not in ("identical", "behind"):
        raise ValueError("Source release must be on main")

    with tempfile.TemporaryDirectory(prefix="frosted-release-") as directory:
        archive = args.archive
        if any(asset["name"] == archive.name for asset in release["assets"]):
            run("gh", "release", "download", args.tag, "--repo", args.repository,
                "--pattern", archive.name, "--dir", directory)
            archive = Path(directory) / archive.name
            validate_archive(archive, source)
        else:
            if release.get("immutable", False):
                raise ValueError("Cannot attach a new archive to an immutable published release")
            run("gh", "release", "upload", args.tag, str(archive), "--repo", args.repository)
        checksum = hashlib.sha256(archive.read_bytes()).hexdigest()
        content = manifest(args.repository, args.tag, checksum)

    binary_tag = f"binary/{args.tag}"
    refs = api(f"{prefix}/git/matching-refs/tags/{binary_tag}")
    existing = next((ref for ref in refs if ref["ref"] == f"refs/tags/{binary_tag}"), None)
    if existing:
        commit = api(f"{prefix}/git/commits/{existing['object']['sha']}")
        existing_manifest = api(f"{prefix}/contents/Package.swift?ref={binary_tag}")
        if ([parent["sha"] for parent in commit["parents"]] != [source]
                or base64.b64decode(existing_manifest["content"]).decode() != content):
            raise ValueError("Existing binary tag differs; publish a new source version")
        print(f"Already published {binary_tag}")
        return

    source_tree = api(f"{prefix}/git/commits/{source}")["tree"]["sha"]
    tree = api(f"{prefix}/git/trees", {
        "base_tree": source_tree,
        "tree": [{"path": "Package.swift", "mode": "100644", "type": "blob", "content": content}],
    })
    commit = api(f"{prefix}/git/commits", {
        "message": f"chore: distribute FrostedUI {args.tag} as an XCFramework",
        "tree": tree["sha"], "parents": [source],
    })
    api(f"{prefix}/git/refs", {"ref": f"refs/tags/{binary_tag}", "sha": commit["sha"]})
    print(f"Published {binary_tag}: {commit['sha']}")


if __name__ == "__main__":
    main()
