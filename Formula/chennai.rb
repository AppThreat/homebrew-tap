class Chennai < Formula
  desc "Hybrid AI agent and TUI for exploring AppThreat atom files"
  homepage "https://github.com/AppThreat/chennai"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-darwin-arm64.tar.gz"
      sha256 "4e7522be3fff02eff80f20850ddbe69675388d97cb4d0375d92f9adc83617e9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-arm64.tar.gz"
      sha256 "ec4d821008b18334551c68852f69d986c98159b87dd187ee413cd83f4f15c621"
    end
    on_intel do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-amd64.tar.gz"
      sha256 "cf49c7f5dcd9bb93fc0c05ae7ba40d5823dd60f74238560eb8097b3d2dac3da7"
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
