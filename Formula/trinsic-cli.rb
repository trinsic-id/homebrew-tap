class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.5.0/trinsic-cli-1.5.0.tar.gz"
  sha256 "a314139f7872b86d6cd93bc91e15bb9bbf0d521d41df3ac79cf0f79ad1dcf4ac"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.4.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "5204b8be5656c92d08c0126fbf1efc3ee4c7c347a9ac1f392a0a5b1b5c43942c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "99c5ea82135eb0fc65f375898e562e38d1203299529eb3acec5f075329f677c7"
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
