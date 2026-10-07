class Devcli < Formula
  desc "Process manager and dashboard for spawned processes"
  homepage "https://github.com/xDelph/devcli"
  version "0.3.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.3.0/devcli-aarch64-apple-darwin.tar.gz"
      sha256 "46f1d1cbd6ac146724d58a4d823cdd1779208eb2d8ee88680702374e6b877412"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.3.0/devcli-x86_64-apple-darwin.tar.gz"
      sha256 "a5e5b0f7a85a4d7c9e5e5b35600abc35679a756736bc23c43a9f1adf95649902"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.3.0/devcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "625c02fef3553251af87686dd65e20972f4ac43d601116c67bfc36bb12bb708a"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.3.0/devcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f358e7efb381cebfb72e1218a26147530300e5d19706d579d99702f70f32239b"
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
