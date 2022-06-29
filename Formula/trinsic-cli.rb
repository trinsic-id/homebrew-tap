class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.6.0/trinsic-cli-1.6.0.tar.gz"
  sha256 "8f88cf98952076031437b6a5323e0e723a64a7c3f145241a44e8f30b28cfc670"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.6.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "de2112eb5104e002f27c0a6a4b0b8a3d691c48d32ca35985cb76d0892387b484"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "667cd9416138ff4e8e8c7112fa009164e7b3892ff55269c27a549d7c688bb0b1"
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
