class Edga < Formula
  desc "EDG C/C++ front end that writes a translation unit as JSON"
  homepage "https://github.com/AppThreat/edga"
  version "0.2.0"
  license "Apache-2.0"
  depends_on macos: :ventura

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/edga/releases/download/v#{version}/edga-darwin-arm64"
      sha256 "74812e1ca70efb88eb5b871bacd6d2ef9332b3ef12478030ea3efadce40bab87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/edga/releases/download/v#{version}/edga-linux-arm64"
      sha256 "c0e017053b124244f7391119e626a0d96971287d9f2773fb4efac7723328f659"
    end
    on_intel do
      url "https://github.com/AppThreat/edga/releases/download/v#{version}/edga-linux-amd64"
      sha256 "ba348e503e6a37034adfa8a4f357f7466d5852df887d1bd7578e3162a9e76311"
    end
  end

  def install
    binary = if OS.mac?
      "edga-darwin-arm64"
    elsif Hardware::CPU.intel?
      "edga-linux-amd64"
    else
      "edga-linux-arm64"
    end
    bin.install binary => "edga"
  end

  test do
    system "#{bin}/edga", "--help"
  end
end
