class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.11.0/trinsic-cli-1.11.1.tar.gz"
  sha256 "f8dda1a5223b8f3311e026e4761c7118360529d17886614cbb0fff74b509fd86"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.9.0"
    sha256 cellar: :any_skip_relocation, monterey:     "acce9f5f298f15f3439183dbd4f9447f883cdacbb001dfb5cda6030811c5357f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "52c7db66c86b765c9debf0d27d963835946f9b159dd379d668306376ab355366"
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
