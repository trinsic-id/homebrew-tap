class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.12.0/trinsic-cli-1.12.0.tar.gz"
  sha256 "1786986b918a8dc0f36272ca3a7a87696c2de4f72c9063ad5a16a2d37bf4564b"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.12.0"
    sha256 cellar: :any_skip_relocation, monterey:     "36c07374f9082abcfe60a0b0ced3749a864c2655ad20ad324592d1ed4d4f68de"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3e7ffba4075faa5f2cf76ecca3736e041d777a848ce0971c201c3a6ac3137e61"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    config = shell_output "#{bin}/trinsic config"

    assert config.downcase[".trinsic/config.toml"]
    assert config.downcase["ok"]
  end
end
