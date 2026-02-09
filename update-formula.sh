#!/bin/bash
# Update Homebrew formula with new release

set -e

VERSION=$1
if [ -z "$VERSION" ]; then
    echo "Usage: ./update-formula.sh v0.1.0"
    exit 1
fi

# Remove 'v' prefix if present
VERSION_NUMBER=${VERSION#v}

echo "📦 Updating Homebrew formula for version ${VERSION}..."
echo ""

# Download binaries and compute checksums
declare -A checksums

platforms=(
    "aarch64-apple-darwin"
    "x86_64-apple-darwin"
    "aarch64-unknown-linux-gnu"
    "x86_64-unknown-linux-gnu"
)

for platform in "${platforms[@]}"; do
    url="https://github.com/xDelph/devcli/releases/download/${VERSION}/devcli-${platform}.tar.gz"
    echo "📥 Downloading $platform..."

    if ! curl -fsSL "$url" -o "/tmp/devcli-${platform}.tar.gz"; then
        echo "❌ Failed to download $platform"
        exit 1
    fi

    checksum=$(shasum -a 256 "/tmp/devcli-${platform}.tar.gz" | awk '{print $1}')
    checksums[$platform]=$checksum
    echo "   SHA256: $checksum"
done

echo ""
echo "✅ All checksums computed"
echo ""

# Update formula file
cat > Formula/devcli.rb <<EOF
class Devcli < Formula
  desc "Powerful CLI for managing spawned processes with config-based management"
  homepage "https://github.com/xDelph/devcli"
  version "${VERSION_NUMBER}"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/${VERSION}/devcli-aarch64-apple-darwin.tar.gz"
      sha256 "${checksums[aarch64-apple-darwin]}"
    else
      url "https://github.com/xDelph/devcli/releases/download/${VERSION}/devcli-x86_64-apple-darwin.tar.gz"
      sha256 "${checksums[x86_64-apple-darwin]}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/xDelph/devcli/releases/download/${VERSION}/devcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "${checksums[aarch64-unknown-linux-gnu]}"
    else
      url "https://github.com/xDelph/devcli/releases/download/${VERSION}/devcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "${checksums[x86_64-unknown-linux-gnu]}"
    end
  end

  def install
    bin.install "devcli"
  end

  test do
    system "#{bin}/devcli", "--version"
  end
end
EOF

echo "✅ Formula updated!"
echo ""
echo "Next steps:"
echo "  1. Review the changes:"
echo "     git diff Formula/devcli.rb"
echo ""
echo "  2. Commit and push:"
echo "     git add Formula/devcli.rb"
echo "     git commit -m \"chore: update formula to ${VERSION}\""
echo "     git push"
echo ""
echo "  3. Test installation:"
echo "     brew upgrade devcli"
