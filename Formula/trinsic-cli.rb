class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.11.0/trinsic-cli-1.11.2.tar.gz"
  sha256 "152920e36a85a0de2c6efdc9bb2a9483fe652cd0dbdb34811b43ed1aa75b0fa7"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.11.2"
    sha256 cellar: :any_skip_relocation, monterey:     "946e3f01972b0813fcd796e2b9600606c1cdb3be5142a65dce684d2c4fe9882c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "18422af036102ba017993457ca073a345d95fe390076b602a6f6f7f1ccf2767a"
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
