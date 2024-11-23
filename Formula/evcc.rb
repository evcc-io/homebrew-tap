# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.131.7"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.131.7/evcc_0.131.7_macOS-all.tar.gz"
    sha256 "953b73eea0fd5e53c5cfd1910f89a99039dbcd2fa1451c7ea2cf613f8d231b99"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.7/evcc_0.131.7_linux-amd64.tar.gz"
        sha256 "3dd3dbd57f6cf06cc0471bb512a9df1e2d752bcb7437b192ae20ec70edb76ad6"

        def install
          bin.install "evcc"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.7/evcc_0.131.7_linux-armv6.tar.gz"
        sha256 "780d7a1e8406e72faff759604c45f57b4fb21ec9790f37ef1e47d8498c158df1"

        def install
          bin.install "evcc"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.7/evcc_0.131.7_linux-arm64.tar.gz"
        sha256 "22c30d13d39c54161ba9d5d87294b00ce0815e019f5887da8be8889d9893afa8"

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
