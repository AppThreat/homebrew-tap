class Chennai < Formula
  desc "Hybrid AI agent and TUI for exploring AppThreat atom files"
  homepage "https://github.com/AppThreat/chennai"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-darwin-arm64.tar.gz"
      sha256 "f176c8ff093790bf347e58d8f6be24b4999f24eea76f794446b9289f247505ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-arm64.tar.gz"
      sha256 "b348d9aeb1fc33175295ac5d167ef005c7ca9bbc974cb4fafda2e980837705bf"
    end
    on_intel do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-amd64.tar.gz"
      sha256 "9fd77c784728c706612b788ee35de4ce5631bd8fb8d30caa79087c086cb1a976"
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
