class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.2.0/trinsic-cli-1.2.2.tar.gz"
  sha256 "677240331aa985a11364af2aea7881bc3cb1d7a3b2f7290d12dd4b56884a7cfd"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.2.2"
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
