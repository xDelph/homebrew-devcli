class Devcli < Formula
  desc "Process manager and dashboard for spawned processes"
  homepage "https://github.com/xDelph/devcli"
  version "0.6.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.6.0/devcli-aarch64-apple-darwin.tar.gz"
      sha256 "02f8a768c13e0f6536a7824bfe625dbaf9278633089a82ac2e84bb123a5b64eb"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.6.0/devcli-x86_64-apple-darwin.tar.gz"
      sha256 "d9af0b55232205ab7ae7a5d209359bba657588349f7d6d7730b64e42177d423f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.6.0/devcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8cde0475c78e342160b39d0af3306a90661105eefaddfb8f8376b574ad84fee3"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.6.0/devcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b6eb1d71a9221fd37dd11dcd82998eabfce63643960128bf87b55e9c0e1f417"
    end
  end

  def install
    bin.install "devcli", "pm-daemon"
  end

  test do
    system "#{bin}/devcli", "--version"
    system "#{bin}/pm-daemon", "--version"
  end
end
