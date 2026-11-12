class Atom < Formula
  desc "Standalone tool for the atom intermediate representation, powered by chen"
  homepage "https://github.com/AppThreat/atom"
  version "4.0.0"
  license "MIT"
  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/atom/releases/download/v#{version}/atom-darwin-arm64"
      sha256 "e9945e59d2f70ab59914b4859c2efc58606028e5a9bf948294cb6d4d7353b517"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/atom/releases/download/v#{version}/atom-arm64"
      sha256 "4aeecd380e848d29cb5faf2d304827d17e601a6a53c05f8faea49965f053dc60"
    end
    on_intel do
      url "https://github.com/AppThreat/atom/releases/download/v#{version}/atom-amd64"
      sha256 "d6ab40fc98bd11c8c685e129175f89cbaa4461dfb475af67f79200cb4996e2e9"
    end
  end

  def install
    binary = if OS.mac?
      "atom-darwin-arm64"
    elsif Hardware::CPU.intel?
      "atom-amd64"
    else
      "atom-arm64"
    end
    bin.install binary => "atom"
  end

  test do
    system "#{bin}/atom", "--help"
  end
end
