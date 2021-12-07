class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.2.0/trinsic-cli-1.2.2.tar.gz"
  sha256 "677240331aa985a11364af2aea7881bc3cb1d7a3b2f7290d12dd4b56884a7cfd"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.1.0"
    sha256 cellar: :any_skip_relocation, catalina:     "7896c2ba9df29db840975efc513c0eed857ac9274f964e3945641b06936c9712"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4c231131baf20cd28918f05b805e36d935cf19997d29e4889cde25a44d2c1c52"
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
