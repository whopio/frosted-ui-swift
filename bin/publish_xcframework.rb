#!/usr/bin/env ruby
require "base64"
require "digest"
require "json"
require "open3"
require "optparse"
require "tmpdir"

module FrostedRelease
  extend self

  def run(*args, data: nil)
    output, status = Open3.capture2(*args, stdin_data: data.to_s)
    raise "Command failed (#{status.exitstatus}): #{args.first}" unless status.success?

    output.strip
  end

  def api(path, payload = nil)
    args = ["gh", "api", path]
    args.concat(["--method", "POST", "--input", "-"]) if payload
    JSON.parse(run(*args, data: payload && JSON.generate(payload)))
  end

  def manifest(repository, tag, checksum)
    <<~SWIFT
      // swift-tools-version: 6.0
      import PackageDescription

      let package = Package(
          name: "FrostedUI",
          platforms: [.iOS(.v17), .macOS(.v15)],
          products: [.library(name: "FrostedUI", targets: ["FrostedUI"])],
          targets: [
              .binaryTarget(
                  name: "FrostedUI",
                  url: "https://github.com/#{repository}/releases/download/#{tag}/FrostedUI.xcframework.zip",
                  checksum: "#{checksum}"
              ),
          ]
      )
    SWIFT
  end

  def validate_archive(archive, source)
    revision = run("unzip", "-p", File.expand_path(archive), "FrostedUI.xcframework/source-revision.txt")
    raise "Archive does not match the source release commit" unless revision == source
  end

  def main(args = ARGV)
    options = { repository: "whopio/frosted-ui-swift" }
    parser = OptionParser.new do |opts|
      opts.banner = "Usage: publish_xcframework.rb TAG ARCHIVE [options]"
      opts.on("--repository OWNER/REPO") { |value| options[:repository] = value }
      opts.on("--prepare-only PATH") { |value| options[:prepare_only] = value }
    end
    parser.parse!(args)
    raise ArgumentError, parser.banner unless args.length == 2

    tag, archive = args
    repository = options[:repository]
    raise ArgumentError, "Expected FrostedUI.xcframework.zip" unless File.basename(archive) == "FrostedUI.xcframework.zip"
    raise ArgumentError, "Expected a stable version tag, such as 0.9.0" unless /\Av?\d+\.\d+\.\d+\z/.match?(tag)
    raise ArgumentError, "Invalid repository" unless /\A[\w.-]+\/[\w.-]+\z/.match?(repository)

    root = File.expand_path("..", __dir__)
    source = run("git", "-C", root, "rev-parse", "HEAD")
    validate_archive(archive, source)
    if options[:prepare_only]
      File.write(options[:prepare_only], manifest(repository, tag, Digest::SHA256.file(archive).hexdigest))
      return
    end

    unless run("git", "-C", root, "status", "--porcelain", "--untracked-files=no").empty?
      raise "Publish from a clean source checkout"
    end

    prefix = "repos/#{repository}"
    release = api("#{prefix}/releases/tags/#{tag}")
    raise "Expected a published stable release" if release.fetch("draft") || release.fetch("prerelease")
    raise "Checkout does not match the source release tag" unless api("#{prefix}/commits/#{tag}").fetch("sha") == source
    unless ["identical", "behind"].include?(api("#{prefix}/compare/main...#{source}").fetch("status"))
      raise "Source release must be on main"
    end

    content = Dir.mktmpdir("frosted-release-") do |directory|
      if release.fetch("assets").any? { |asset| asset.fetch("name") == File.basename(archive) }
        run("gh", "release", "download", tag, "--repo", repository,
            "--pattern", File.basename(archive), "--dir", directory)
        archive = File.join(directory, File.basename(archive))
        validate_archive(archive, source)
      else
        raise "Cannot attach a new archive to an immutable published release" if release["immutable"]

        run("gh", "release", "upload", tag, archive, "--repo", repository)
      end
      manifest(repository, tag, Digest::SHA256.file(archive).hexdigest)
    end

    binary_tag = "binary/#{tag}"
    refs = api("#{prefix}/git/matching-refs/tags/#{binary_tag}")
    existing = refs.find { |ref| ref.fetch("ref") == "refs/tags/#{binary_tag}" }
    if existing
      commit = api("#{prefix}/git/commits/#{existing.fetch('object').fetch('sha')}")
      existing_manifest = api("#{prefix}/contents/Package.swift?ref=#{binary_tag}")
      unless commit.fetch("parents").map { |parent| parent.fetch("sha") } == [source] &&
             Base64.decode64(existing_manifest.fetch("content")) == content
        raise "Existing binary tag differs; publish a new source version"
      end
      puts "Already published #{binary_tag}"
      return
    end

    source_tree = api("#{prefix}/git/commits/#{source}").fetch("tree").fetch("sha")
    tree = api("#{prefix}/git/trees", {
      "base_tree" => source_tree,
      "tree" => [{ "path" => "Package.swift", "mode" => "100644", "type" => "blob", "content" => content }]
    })
    commit = api("#{prefix}/git/commits", {
      "message" => "chore: distribute FrostedUI #{tag} as an XCFramework",
      "tree" => tree.fetch("sha"), "parents" => [source]
    })
    api("#{prefix}/git/refs", { "ref" => "refs/tags/#{binary_tag}", "sha" => commit.fetch("sha") })
    puts "Published #{binary_tag}: #{commit.fetch('sha')}"
  end
end

FrostedRelease.main if $PROGRAM_NAME == __FILE__
