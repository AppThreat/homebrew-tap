class Chennai < Formula
  desc "Hybrid AI agent and TUI for exploring AppThreat atom files"
  homepage "https://github.com/AppThreat/chennai"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-darwin-arm64.tar.gz"
      sha256 "53b08051da22047f03e427c22c15d05edc7dbc7a6d989e8a9a520ef428d5c8fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-arm64.tar.gz"
      sha256 "edc7e309878a8cc9333687603fc8dead78e927a34dc1e1be48ac7537c58dda27"
    end
    on_intel do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-amd64.tar.gz"
      sha256 "35e0c96480f4dc962a1ad366edd87396e18f95f4fb448de48c3e641a19c05d85"
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
