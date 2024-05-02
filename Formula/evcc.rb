# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.126.1"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.126.1/evcc_0.126.1_macOS-all.tar.gz"
    sha256 "f67791ac69b18b335300d1224de41aa9894ab14cc76845dc9470bc3ad9be04f5"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.126.1/evcc_0.126.1_linux-amd64.tar.gz"
      sha256 "4ef4af045442eee00afa482bc4bc9928261b65254f2387ee05e2c23ce7e85f9b"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.126.1/evcc_0.126.1_linux-armv6.tar.gz"
      sha256 "f6f48cc8bdffadfd282dd137a7a5838f459fc7f2f6e65b567d3760a64a668f30"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.126.1/evcc_0.126.1_linux-arm64.tar.gz"
      sha256 "9f4f6e2bf58005ad1582acfe9ea0b187d53a92273c45308b215ce38484e625b6"

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
