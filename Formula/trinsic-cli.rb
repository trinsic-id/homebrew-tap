class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.9.0/trinsic-cli-1.9.0.tar.gz"
  sha256 "41640736aaa3d5802e9fed607045bccc32f236d7bc7bf6bbe4448da4c5475552"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.9.0"
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
