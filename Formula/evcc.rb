# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.113.0"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.113.0/evcc_0.113.0_macOS-all.tar.gz"
    sha256 "4f6c95452c8fecf6445942083be174b8358bb0bc78c9fcdd4f38ee27ec82bf84"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.113.0/evcc_0.113.0_linux-arm64.tar.gz"
      sha256 "88bb38fbcb4316c8fb542af367c02c3916b22a7ff08e14ade2a062907ecb21c3"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.113.0/evcc_0.113.0_linux-amd64.tar.gz"
      sha256 "48bd7c4367746ee2735251627ffd10378ec45643066f1eae35074bb1c3434fcb"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.113.0/evcc_0.113.0_linux-armhf.tar.gz"
      sha256 "dfe29b7b8bc1ba61c0d0cdb985806adee9567eaed9f197b4cb472501e9220661"

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
