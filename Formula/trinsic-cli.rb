class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.8.0/trinsic-cli-1.8.1.tar.gz"
  sha256 "4637f78c3a646291541ad73b1467685eeec7673c0770f3b2c4d7e60368f6a4ff"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.7.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "dd5bcc088992416af7c9a3dda0f41df9eb3e79ba8bb8784dc0f960c5da38801b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0099b1304b00c61d839f9c74d954c2037fdc6a024344628de0e667d5769502d8"
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
