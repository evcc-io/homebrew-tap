# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.98"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.98/evcc_0.98_macOS_all.tar.gz"
    sha256 "b8f3f271d666ae936fe8c815d50416f2448118f0a81e000c5d2e8278ee8f644f"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.98/evcc_0.98_linux_armv6.tar.gz"
      sha256 "7ba193e98381ed671944b8db845d86b246ae0d92d0e9d6fa210cdcfdc0e5e916"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.98/evcc_0.98_linux_arm64.tar.gz"
      sha256 "843d08bc46425f7167ccb1ffb5be62560d4087352c75e244c71c77bfd79a15ff"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.98/evcc_0.98_linux_amd64.tar.gz"
      sha256 "98b8d8e8e5f580512eed5c70b149d80dfe24394dd796e17636bf604849fc97a9"

      def install
        bin.install "evcc"
      end
    end
  end

  plist_options :startup => false

  def plist; <<~EOS
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
