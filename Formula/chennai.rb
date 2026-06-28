class Chennai < Formula
  desc "Hybrid AI agent and TUI for exploring AppThreat atom files"
  homepage "https://github.com/AppThreat/chennai"
  license "MIT"

  on_macos do
    on_arm do
      version "0.2.0"
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-darwin-arm64.tar.gz"
      sha256 "TBD"
    end
    on_intel do
      version "0.2.0"
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-darwin-amd64.tar.gz"
      sha256 "TBD"
    end
  end

  on_linux do
    on_arm do
      version "0.2.0"
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-arm64.tar.gz"
      sha256 "TBD"
    end
    on_intel do
      version "0.2.0"
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-amd64.tar.gz"
      sha256 "TBD"
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
