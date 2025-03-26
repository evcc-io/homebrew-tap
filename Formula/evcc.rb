# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.202.0"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.202.0/evcc_0.202.0_macOS-all.tar.gz"
    sha256 "7371236c5c83d9830ce345c6cb170ebcc57d10f370329cfb3d33df801f2716d4"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.202.0/evcc_0.202.0_linux-amd64.tar.gz"
        sha256 "bd28dbe63b929c26b336261957e7c4604defea5a3c42cdfee80497210b09de18"

        def install
          bin.install "evcc"
        end
      end
    end
    if Hardware::CPU.arm?
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.202.0/evcc_0.202.0_linux-armv6.tar.gz"
        sha256 "d76e5aff4e0a3a0fb405c569ff5968d8265d2c79f012e593750f27a1ea34ba16"

        def install
          bin.install "evcc"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.202.0/evcc_0.202.0_linux-arm64.tar.gz"
        sha256 "df80ead1ad5731c76ad21fb0b8e1287d0a61a5ca02cf31300331d1f05ed00e57"

        def install
          bin.install "evcc"
        end
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
