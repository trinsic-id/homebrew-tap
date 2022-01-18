class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.3.0/trinsic-cli-1.3.0.tar.gz"
  sha256 "e8cd1f0620fe52d4b8f544bec71d1612f752f669408bc2961049636b56c5f1a4"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "96cc535856cee4d0d2e4bfeb5cb489baa53e89b8290adf6a4145e883f8e22e78"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cfdba5acfd09a6deaf7579b13b97cdcb18c3b88895786cfa8b72c108d57032a9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    config_toml = shell_output "#{bin}/trinsic config --show"

    assert config_toml.downcase[".trinsic/config.toml"]
    assert config_toml.downcase["[server]"]
  end
end
