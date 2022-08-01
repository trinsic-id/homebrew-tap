class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.7.0/trinsic-cli-1.7.0.tar.gz"
  sha256 "78e4370ddfdba125a1b0dcc8c0a30424b69aee6eebafd721c2491f59e1436094"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.6.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "84d3e12381afc0023f3463e2a96321301021f4e548b107936ea06116af70ad04"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6b99c0db7ef2d615aca99bf6630d36a7e9e82b782c940d918562058b1fc12c8f"
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
