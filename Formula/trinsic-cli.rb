class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.3.0/trinsic-cli-1.3.1.tar.gz"
  sha256 "2cada9e0e5b5a62582b0ec35368a14a6bcb088df94b66fa445dd60977f7ce1fb"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.3.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "fc21e0cf92aacdb45887b3206f7ec5e79b00e62b2f319ad6cabb87acbf83a277"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9433e31205d130daa3de160946436eca25b3244e8c610b8934b45057562f8882"
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
