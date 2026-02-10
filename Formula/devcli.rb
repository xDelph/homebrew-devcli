class Devcli < Formula
  desc "Powerful CLI for managing spawned processes with config-based management"
  homepage "https://github.com/xDelph/devcli"
  version "0.1.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.1.0/devcli-aarch64-apple-darwin.tar.gz"
      sha256 "cb63e5ad2775c083a823e24afe0739a371bd2edcac54c20c604aa414378d8fd5"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.1.0/devcli-x86_64-apple-darwin.tar.gz"
      sha256 "143bab026ed4f92c5b721b95cd347677a490ae68872842b6c5f1d5ea4c2a001b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/v0.1.0/devcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dfcc418d242e60830def9005f0b9373fb6f2d0a6bc01f18e0e029a070e9f3e6"
    else
      url "https://github.com/xDelph/devcli/releases/download/v0.1.0/devcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8008230cd1fb5476663cd3863cb6d31916bd87f6e1f9872fed2cad928e26ffb7"
    end
  end

  def install
    bin.install "devcli"
  end

  test do
    system "#{bin}/devcli", "--version"
  end
end
