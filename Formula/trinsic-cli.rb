class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.11.0/trinsic-cli-1.11.2.tar.gz"
  sha256 "152920e36a85a0de2c6efdc9bb2a9483fe652cd0dbdb34811b43ed1aa75b0fa7"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.11.1"
    sha256 cellar: :any_skip_relocation, monterey:     "ed85a4c4d7d07ce7dd8270f7313b6adfe7a5653e889e84a53de96ab0ea8e96c4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9dcc5774fb9dd2b8a84024457ff84b5d86bd808ccfd4dec3df39a74786fd5b04"
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
