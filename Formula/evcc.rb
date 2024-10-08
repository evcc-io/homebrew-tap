# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.130.13"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.130.13/evcc_0.130.13_macOS-all.tar.gz"
    sha256 "ddf2bf53445cff94f0e111cf6622943cf8c27e0a7cd3dcb0436711c97e9d8262"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.130.13/evcc_0.130.13_linux-amd64.tar.gz"
        sha256 "e14c48a71e86cba150558c894fb23b37fedfb2f2082491a7c2b1d38e71484fc6"

        def install
          bin.install "evcc"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.130.13/evcc_0.130.13_linux-armv6.tar.gz"
        sha256 "9a3365c89d84cf3162e42390db5bf68ee609519c859d76199fae13dab9caf572"

        def install
          bin.install "evcc"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.130.13/evcc_0.130.13_linux-arm64.tar.gz"
        sha256 "5b2525a8fc3b9cbfb58f071a0b94e7fc31af04b33ca9ed3644b26ceac14a3c63"

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
