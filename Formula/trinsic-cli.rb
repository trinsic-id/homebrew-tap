class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.1.0/trinsic-cli-1.1.0.tar.gz"
  sha256 "cc3b1479aaaf769abd795cb3e23755e68964093d7f38ea9d96d2a8518f896d20"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.0.0"
    sha256 cellar: :any_skip_relocation, catalina:     "acc2222ce83e8684a0ae78a7187dc25016acba2a076c16b29679c4bc6f01b99c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d223086263bf62cfb1a1511fcb9a3124dd3ecbb8135c39336b95b4ae8e4dab52"
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
