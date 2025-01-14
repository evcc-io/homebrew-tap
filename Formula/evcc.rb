# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.132.1"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.132.1/evcc_0.132.1_macOS-all.tar.gz"
    sha256 "aba1f39d5a5f4bcc26231ee6872b16226995935566211ac84b5a19daaf01cd4f"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.132.1/evcc_0.132.1_linux-amd64.tar.gz"
        sha256 "b86b5a59dcbc2a7a1b1f831285531ac038b1e29b6babb9b03626c4d77c6a86ff"

        def install
          bin.install "evcc"
        end
      end
    end
    if Hardware::CPU.arm?
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.132.1/evcc_0.132.1_linux-armv6.tar.gz"
        sha256 "7c878d4fa859ab87905af62f17c205d0a2ebc4f15c82f895635d382623d4a4f4"

        def install
          bin.install "evcc"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.132.1/evcc_0.132.1_linux-arm64.tar.gz"
        sha256 "24b2be98bd88ce27abc5be5505bc19f0848ae92c798436c5cfb1101acfed4a18"

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
