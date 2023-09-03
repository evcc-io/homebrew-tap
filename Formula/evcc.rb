# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.119.4"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.119.4/evcc_0.119.4_macOS-all.tar.gz"
    sha256 "2cf4da93d6e14a47be125ffbce3b3d5b40e7bbfdbbf769e931e47a4f749826e2"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.119.4/evcc_0.119.4_linux-armv6.tar.gz"
      sha256 "45461bcb45d24571b0cf9cd75d8265962fdf7c5b02936c2640602759e43d58f2"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.119.4/evcc_0.119.4_linux-amd64.tar.gz"
      sha256 "b78840c430eb3ae0cf881310b46e722f5264e533900299b417399b3e9eff4adb"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.119.4/evcc_0.119.4_linux-arm64.tar.gz"
      sha256 "f8924ed49c405dc4f869216face8a9675abb29b9ef29b2a5717a840bc28b3316"

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
