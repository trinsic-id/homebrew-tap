class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.3.0/trinsic-cli-1.3.2.tar.gz"
  sha256 "bc3bbb93813edee1a6e57de011e7ef0e8a6839d2bfd50f3a0ff7ac89fb79977c"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.3.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "1bcc25f7064447bb253985d7501f216be04d62681b7bec3a6325953e37a8747e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4e0184be71a3efc4f6ac14d6cbc1bb717a57cf0077534f55126a5a040ad4c8ba"
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
