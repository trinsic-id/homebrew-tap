class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.4.0/trinsic-cli-1.4.0.tar.gz"
  sha256 "de4664e749e0479413b859e2494569e2d9bb93205749cef1647e41cbe9bf96d6"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.4.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "0ba2cda81179fe84b0204dd39d58fc60f304ae18a53e2f661c08b1c39b71d784"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "225a74a4edff48124a993ba298fe67a149655e40f416cc1d75a34a6e5aa6983d"
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
