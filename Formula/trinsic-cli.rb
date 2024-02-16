class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.13.0/trinsic-cli-1.13.0.tar.gz"
  sha256 "d0e5c1cb6c7e0135e8db9f9b49d2b65b99e4ab724590ecbcdfca344e3c6f734b"
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
