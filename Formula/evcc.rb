# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.106.3"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.106.3/evcc_0.106.3_macOS_all.tar.gz"
    sha256 "d370c27e2e0cb77e56fd49d4aced3f8e62e976bce815b9c0d4ec757781f688b0"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.3/evcc_0.106.3_linux_armv6.tar.gz"
      sha256 "9032257950d00cc8904db156d782b95aad1a5c210121a0d8c2cd844919a25baa"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.3/evcc_0.106.3_linux_arm64.tar.gz"
      sha256 "d8b6fe42edb3ddf08e89b58da745a3d352acd6fabd2d396045952b24b8797708"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.106.3/evcc_0.106.3_linux_amd64.tar.gz"
      sha256 "ce946d0e87f3fad7ed5bd8ab99cd31737d2e8d634f61a8e512ea6d33952a963c"

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
