# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.112.1"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.112.1/evcc_0.112.1_macOS_all.tar.gz"
    sha256 "8b54d4dba277f052f2463e047d395aaa28d95caceba35da8d113e97aeac7fb3c"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.112.1/evcc_0.112.1_linux_arm64.tar.gz"
      sha256 "bdf568d8a4358b58628fb3058db62a293f70137dcae48473c3254559d45d909d"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.112.1/evcc_0.112.1_linux_amd64.tar.gz"
      sha256 "6cf584f436281cd3d3b6b65ce168f28c90f49b34780b9bb5b59dd7532d7e6be4"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.112.1/evcc_0.112.1_linux_armv6.tar.gz"
      sha256 "4965ce7f09408ee33fcf98ba616b47bddf045af1ff93d2fa3db9b2cd28065f11"

      def install
        bin.install "evcc"
      end
    end
  end

  plist_options startup: false

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>Program</key>
    <string>#{bin}/evcc</string>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>#{var}/log/evcc.log</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/evcc.log</string>
  </dict>
</plist>

    EOS
  end

  test do
    system "#{bin}/evcc --version"
  end
end
