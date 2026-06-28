class Chennai < Formula
  desc "Hybrid AI agent and TUI for exploring AppThreat atom files"
  homepage "https://github.com/AppThreat/chennai"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-darwin-arm64.tar.gz"
      sha256 "9eeaa9db7e07cdc632e460b9ced4ee5279e926a085cc038d0e8634494dc67b1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-arm64.tar.gz"
      sha256 "609a19ee4aaccd931519a045a3198d7cd4451a3326e7cd9a577755063f092286"
    end
    on_intel do
      url "https://github.com/AppThreat/chennai/releases/download/v#{version}/chennai-linux-amd64.tar.gz"
      sha256 "86fcf9e381eb47e9e8b90a053bd8dd548314906f9508af015acee08039cdb8e0"
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
