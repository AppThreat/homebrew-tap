class Parsa < Formula
  desc "Standalone parsers that complement the atom project"
  homepage "https://github.com/AppThreat/atom-parsetools"
  version "2.0.0"
  license "MIT"
  depends_on macos: :ventura

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/atom-parsetools/releases/download/v#{version}/parsa-darwin-arm64"
      sha256 "814b43beeed096f824b17d47e9dfbf90a157f4df6f2ae166c619fabf51317d27"
    end
    on_intel do
      url "https://github.com/AppThreat/atom-parsetools/releases/download/v#{version}/parsa-darwin-amd64"
      sha256 "d5ed475346a7a49b76bd86472029bdcb27f5386e8966d4da8746cc253041c70f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/atom-parsetools/releases/download/v#{version}/parsa-linux-arm64"
      sha256 "dac9ce94ebcb8a6a18eea9e0c1516b62ae0991c201974dc9aa0f7baa8c327f2b"
    end
    on_intel do
      url "https://github.com/AppThreat/atom-parsetools/releases/download/v#{version}/parsa-linux-amd64"
      sha256 "df06a95c7ed75a849457f184bac7e1f8a8f4c994c798d563e7ddfd6b586bdc39"
    end
  end

  def install
    binary = if OS.mac? && Hardware::CPU.arm?
      "parsa-darwin-arm64"
    elsif OS.mac?
      "parsa-darwin-amd64"
    elsif Hardware::CPU.intel?
      "parsa-linux-amd64"
    else
      "parsa-linux-arm64"
    end
    bin.install binary => "parsa"
  end

  test do
    system "#{bin}/parsa", "--help"
  end
end
