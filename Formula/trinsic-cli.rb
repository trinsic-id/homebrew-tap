class TrinsicCli < Formula
  desc "Command-line interface for Trinsic Ecosystems APIs"
  homepage "https://docs-v2.trinsic.id/"
  url "https://github.com/trinsic-id/sdk/releases/download/v1.6.0/trinsic-cli-1.6.0.tar.gz"
  sha256 "8F88CF98952076031437B6A5323E0E723A64A7C3F145241A44E8F30B28CFC670"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/trinsic-cli-1.5.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "628fa4362228558a543c0297b4630c334c0ddf33ed06525c4f4efc17f7980332"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0bea4826435f683e355b831a756e8cb656fdcce68c67acfd3c2e713f6498267"
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
