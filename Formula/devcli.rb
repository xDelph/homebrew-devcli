class Devcli < Formula
  desc "Powerful CLI for managing spawned processes with config-based management"
  homepage "https://github.com/xDelph/devcli"
  version "0.1.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.1.0/devcli-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_ARM64_BINARY"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.1.0/devcli-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_X86_64_BINARY"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.1.0/devcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_LINUX_ARM64_BINARY"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.1.0/devcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_LINUX_X86_64_BINARY"
    end
  end

  def install
    bin.install "devcli"
  end

  test do
    system "#{bin}/devcli", "--version"
  end
end
