# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.118.8"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.118.8/evcc_0.118.8_macOS-all.tar.gz"
    sha256 "e4f7576773f3306ff1a06e7e166a525c232ecd09d1d8c0938eee87c717bbb17e"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.118.8/evcc_0.118.8_linux-armv6.tar.gz"
      sha256 "f0a7781ef6680e8f6d65e1365fddafbfe474382426c3da696e6b13962058776b"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.118.8/evcc_0.118.8_linux-arm64.tar.gz"
      sha256 "6410585f8bb5ecfbbbc0a5f427f177d1f235e1bcaef759f54c722f8305a4f1ad"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.118.8/evcc_0.118.8_linux-amd64.tar.gz"
      sha256 "f3a6ab7df4f402b1bf9920be615c33aa86c813755bb47c74d5b4867097295385"

      def install
        bin.install "evcc"
      end
    end
  end

  service do
    run [opt_bin/"evcc"]
    working_dir HOMEBREW_PREFIX
    keep_alive true
    log_path var/"log/evcc.log"
    error_log_path var/"log/evcc.log"
  end

  test do
    system "#{bin}/evcc --version"
  end
end
