# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.106.4"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.106.4/evcc_0.106.4_macOS_all.tar.gz"
    sha256 "fa7219e158fc76c1705add1e29edfa7af81a53cb102db110becfdc19c970fe70"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.4/evcc_0.106.4_linux_armv6.tar.gz"
      sha256 "6a97b2429ee03a9883d4a49d918b712d3d8b6f57debbb6b808fc9281eb27586b"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.4/evcc_0.106.4_linux_arm64.tar.gz"
      sha256 "cb7352612ccbd5559f6296eab46440494d6b56a96020fdf6274ffbea6fb5dd97"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.4/evcc_0.106.4_linux_amd64.tar.gz"
      sha256 "ddab5ecc1218f2ccb50156c376d113ae50215d9951fe836406307620e7518e30"

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
