class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.3.0/trinsic-cli-1.3.0.tar.gz"
  sha256 "e8cd1f0620fe52d4b8f544bec71d1612f752f669408bc2961049636b56c5f1a4"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.3.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "b4de5ab9762ed54f91bb677fdf41194ba5c282e63c78407ae0e3ff6ffa4ece25"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3884164836b2353d8a201e6749d3fd3c31e1f9c2694f58cec986771b9ac70b04"
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
