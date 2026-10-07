class Devcli < Formula
  desc "Process manager and dashboard for spawned processes"
  homepage "https://github.com/xDelph/devcli"
  version "0.5.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.5.0/devcli-aarch64-apple-darwin.tar.gz"
      sha256 "46dd750967191809f5b21605ec74c98a078c9fff0c4f1c870192f5a878469c96"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.5.0/devcli-x86_64-apple-darwin.tar.gz"
      sha256 "c0ee049e4fa3e319cdb5ce244532305e2078601476b5422b72655f7e174d6ced"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.5.0/devcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb1ad6268aa6b130cb0aabbbc68cee1b3eaf7e3e190efedbc0ebac8437a9da58"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.5.0/devcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c74f775e4bb1e71c5e8671d7fc929fb89c03cf625a50862b07ac0af7fed58b5"
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
