class Chennai < Formula
  desc "Hybrid AI agent and TUI for exploring AppThreat atom files"
  homepage "https://github.com/AppThreat/chennai"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-darwin-arm64.tar.gz"
      sha256 "f805cecc7c039ffa55a6bbc4a9fdc615af442da8b38448606614a412ce2ffbc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-arm64.tar.gz"
      sha256 "32493788b6e74fa9a816263db35d96c99bda810375bdfbc9bacfc3b5685ff9f5"
    end
    on_intel do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-amd64.tar.gz"
      sha256 "b3a350bd72662806b0a735da4443ff562a29b650d829b0bf1e15645f91e38478"
    end
  end

  def install
    bin.install "chennai"
    bin.install "chennai-engine"
  end

  test do
    system "#{bin}/chennai", "--help"
  end
end
