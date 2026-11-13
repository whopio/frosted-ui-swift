require "fileutils"
require "minitest/autorun"
require "minitest/mock"
require_relative "../../bin/publish_xcframework"

class PublishTests < Minitest::Test
  def setup
    @root = Dir.mktmpdir
    @archive = File.join(@root, "FrostedUI.xcframework.zip")
    @hosted = File.join(@root, "hosted.zip")
    @source = "a" * 40
    write_archive(@archive, "rebuilt", @source)
    write_archive(@hosted, "original", @source)
    @mutations = []
    @commands = []
    @existing = false
    @wrong_parent = false
    @source_status = "behind"
    @release = { "draft" => false, "prerelease" => false, "assets" => [{ "name" => File.basename(@archive) }] }
    @manifest = FrostedRelease.manifest("whopio/frosted-ui-swift", "0.9.0", Digest::SHA256.file(@hosted).hexdigest)
    @real_run = FrostedRelease.method(:run)
  end

  def teardown
    FileUtils.remove_entry(@root)
  end

  def write_archive(path, payload, revision)
    Dir.mktmpdir do |directory|
      FileUtils.mkdir_p(File.join(directory, "FrostedUI.xcframework"))
      File.write(File.join(directory, "FrostedUI.xcframework/source-revision.txt"), revision)
      File.write(File.join(directory, "build.txt"), payload)
      FileUtils.rm_f(path)
      _, status = Open3.capture2("zip", "-qr", path, "FrostedUI.xcframework", "build.txt", chdir: directory)
      assert status.success?
    end
  end

  def run_command(*args, data: nil)
    return @real_run.call(*args, data: data) if args.first == "unzip"
    return args.include?("status") ? "" : @source if args.first == "git"

    @commands << args
    if args.first(3) == ["gh", "release", "download"]
      FileUtils.cp(@hosted, File.join(args.last, File.basename(@archive)))
      return ""
    end
    return "" if args.first(3) == ["gh", "release", "upload"]

    flunk "Unexpected command: #{args.first(3)}"
  end

  def api(path, payload = nil)
    if payload
      @mutations << [path, payload]
      return { "sha" => "generated" }
    end
    case path
    when %r{/releases/tags/} then @release
    when %r{/compare/} then { "status" => @source_status }
    when %r{/git/matching-refs/}
      @existing ? [{ "ref" => "refs/tags/binary/0.9.0", "object" => { "sha" => "binary" } }] : []
    when %r{/git/commits/binary} then { "parents" => [{ "sha" => @wrong_parent ? "wrong" : @source }] }
    when %r{/git/commits/} then { "tree" => { "sha" => "source-tree" } }
    when %r{/contents/Package.swift} then { "content" => Base64.strict_encode64(@manifest) }
    when %r{/commits/} then { "sha" => @source }
    else flunk "Unexpected API request: #{path}"
    end
  end

  def publish(extra_args = [])
    FrostedRelease.stub(:run, method(:run_command)) do
      FrostedRelease.stub(:api, method(:api)) do
        FrostedRelease.main(["0.9.0", @archive] + extra_args)
      end
    end
  end

  def test_interrupted_upload_uses_hosted_checksum_and_preserves_source_tree
    publish
    tree = @mutations.first.last
    assert_equal "source-tree", tree.fetch("base_tree")
    assert_equal [{ "path" => "Package.swift", "mode" => "100644", "type" => "blob", "content" => @manifest }], tree.fetch("tree")
    assert_equal "refs/tags/binary/0.9.0", @mutations.last.last.fetch("ref")
    refute @commands.any? { |args| args[2] == "upload" }
  end

  def test_completed_publication_is_idempotent
    @existing = true
    publish
    assert_empty @mutations
  end

  def test_existing_tag_from_other_source_is_not_replaced
    @existing = true
    @wrong_parent = true
    assert_match(/Existing binary tag differs/, assert_raises(RuntimeError) { publish }.message)
    assert_empty @mutations
  end

  def test_existing_tag_with_other_manifest_is_not_replaced
    @existing = true
    @manifest = "different manifest"
    assert_match(/Existing binary tag differs/, assert_raises(RuntimeError) { publish }.message)
    assert_empty @mutations
  end

  def test_source_outside_main_is_rejected_before_upload
    @source_status = "diverged"
    assert_match(/must be on main/, assert_raises(RuntimeError) { publish }.message)
    assert_empty @mutations
    assert_empty @commands
  end

  def test_archive_from_other_source_is_rejected
    assert_match(/does not match/, assert_raises(RuntimeError) { FrostedRelease.validate_archive(@archive, "b" * 40) }.message)
  end

  def test_hosted_archive_from_other_source_is_rejected
    write_archive(@hosted, "wrong build", "b" * 40)
    assert_match(/does not match/, assert_raises(RuntimeError) { publish }.message)
    assert_empty @mutations
  end

  def test_new_upload_uses_local_checksum
    @release["assets"] = []
    publish
    assert @commands.any? { |args| args[2] == "upload" }
    expected = FrostedRelease.manifest("whopio/frosted-ui-swift", "0.9.0", Digest::SHA256.file(@archive).hexdigest)
    assert_equal expected, @mutations.first.last.fetch("tree").first.fetch("content")
  end

  def test_immutable_release_without_archive_is_rejected
    @release["assets"] = []
    @release["immutable"] = true
    assert_match(/immutable/, assert_raises(RuntimeError) { publish }.message)
    assert_empty @commands
    assert_empty @mutations
  end

  def test_prepare_only_does_not_access_github
    path = File.join(@root, "Package.swift")
    publish(["--prepare-only", path])
    assert_equal FrostedRelease.manifest("whopio/frosted-ui-swift", "0.9.0", Digest::SHA256.file(@archive).hexdigest), File.read(path)
    assert_empty @commands
    assert_empty @mutations
  end
end
