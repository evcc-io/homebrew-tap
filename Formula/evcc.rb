# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.102"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.102/evcc_0.102_macOS_all.tar.gz"
    sha256 "3014094e3c71cefd4b76685eebb666ad2a5e4eb315d0787417465f875bf25f48"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.102/evcc_0.102_linux_armv6.tar.gz"
      sha256 "59ca5d877cac21e1b03c19f63c9c7a5d4e85c78508c434412dc4c3f004b72b52"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.102/evcc_0.102_linux_amd64.tar.gz"
      sha256 "d62eac67e2d3696093fe8b27c03caa3e1e25d90f90a33dfb7341d88982aec777"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.102/evcc_0.102_linux_arm64.tar.gz"
      sha256 "6db99d3f9640c98cd2524a2a4dd8df59d3ab5063ebef1f40b5c8efe689a7b903"

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
