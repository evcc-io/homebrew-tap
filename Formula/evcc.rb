# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.120.2"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.120.2/evcc_0.120.2_macOS-all.tar.gz"
    sha256 "9fb8ccdd2783f22ce374b8745b0bcc16ba3211b854f3366f3eca8d5bb15798c4"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.120.2/evcc_0.120.2_linux-arm64.tar.gz"
      sha256 "749bec32a3cfca58a5453d28b8db7c049458da44f3cb0af632fb350205fac108"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.120.2/evcc_0.120.2_linux-amd64.tar.gz"
      sha256 "817fbc3ecf2f5ad7ce3312f2ac0fc0323009e042165e711c9beaffd41d65ce30"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.120.2/evcc_0.120.2_linux-armv6.tar.gz"
      sha256 "f5920947ba674429a2a8816033d25ed23202e70541fb0c9b1f2afbb416503269"

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
