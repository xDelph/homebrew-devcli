class Devcli < Formula
  desc "Process manager and dashboard for spawned processes"
  homepage "https://github.com/xDelph/devcli"
  version "0.6.1"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.6.1/devcli-aarch64-apple-darwin.tar.gz"
      sha256 "f6795e0c5c2f52dbe8661fa6a76db7832d065e57185253d1348acd111a44cf1a"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.6.1/devcli-x86_64-apple-darwin.tar.gz"
      sha256 "98ba56cc4cd98a1fd5e9ff54f182649749959bd434a62dfcd18f90929f7bc3f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.6.1/devcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d10186cc3a308f5d13e947e2f570b06ea0db9c7f2567a5d705cae0e8b615ab9"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.6.1/devcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b6886b952eea5abbca7c33e966867bd35bcab52499b3543649badcad3920be7"
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
