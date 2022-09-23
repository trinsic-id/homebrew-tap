class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.8.0/trinsic-cli-1.8.1.tar.gz"
  sha256 "4637f78c3a646291541ad73b1467685eeec7673c0770f3b2c4d7e60368f6a4ff"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.8.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "89246d57ec3b808dbad1c99bcf0b0d837b8ad3fb43b978331a2ea18a3676f6f4"
    sha256                               x86_64_linux: "a9935e178e425a4faf3ad0dde0b5a40f6104ddfd58ba5236deb282da36dea754"
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
