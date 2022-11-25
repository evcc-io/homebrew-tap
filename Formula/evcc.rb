# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.108.0"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.108.0/evcc_0.108.0_macOS_all.tar.gz"
    sha256 "8394ba10498a982bd77ab29dddca9ae7e347cd10abd41007c5d37fb4b2d8244e"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.108.0/evcc_0.108.0_linux_amd64.tar.gz"
      sha256 "3bba394aa3e13e6cb7b0a0c5e66543095191ad5cf5e3f5f7b55dc1aa5c83a9c0"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.108.0/evcc_0.108.0_linux_armv6.tar.gz"
      sha256 "fca29ad412acf8cefd6a79ffac6ef32e10783201e31abee0bba1fd1082ea9f44"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.108.0/evcc_0.108.0_linux_arm64.tar.gz"
      sha256 "f66eba638a8107eceb4c20d0ba7d89485975ee86ae3667a5c5bddc2cceed2f3a"

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
