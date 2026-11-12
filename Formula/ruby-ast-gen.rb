class RubyAstGen < Formula
  desc "Ruby AST generator tool with support for Ruby 1.8 to 4.0 syntax"
  homepage "https://github.com/AppThreat/ruby_ast_gen"
  version "2.1.0"
  license "Apache-2.0"
  depends_on macos: :sonoma

  on_macos do
    on_arm do
      url "https://github.com/AppThreat/ruby_ast_gen/releases/download/v#{version}/ruby_ast_gen-#{version}-macos-arm64"
      sha256 :no_check # replace with the value from the release SHA256SUMS once v2.1.0 is published
    end
    on_intel do
      url "https://github.com/AppThreat/ruby_ast_gen/releases/download/v#{version}/ruby_ast_gen-#{version}-macos-x86_64"
      sha256 :no_check # replace with the value from the release SHA256SUMS once v2.1.0 is published
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AppThreat/ruby_ast_gen/releases/download/v#{version}/ruby_ast_gen-#{version}-linux-gnu-arm64"
      sha256 :no_check # replace with the value from the release SHA256SUMS once v2.1.0 is published
    end
    on_intel do
      url "https://github.com/AppThreat/ruby_ast_gen/releases/download/v#{version}/ruby_ast_gen-#{version}-linux-gnu-x86_64"
      sha256 :no_check # replace with the value from the release SHA256SUMS once v2.1.0 is published
    end
  end

  def install
    binary = if OS.mac? && Hardware::CPU.arm?
      "ruby_ast_gen-#{version}-macos-arm64"
    elsif OS.mac?
      "ruby_ast_gen-#{version}-macos-x86_64"
    elsif Hardware::CPU.intel?
      "ruby_ast_gen-#{version}-linux-gnu-x86_64"
    else
      "ruby_ast_gen-#{version}-linux-gnu-arm64"
    end
    bin.install binary => "ruby_ast_gen"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ruby_ast_gen --version")
  end
end
