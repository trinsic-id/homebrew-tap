class Okapi < Formula
  desc "Set of tools that support workflows for authentic data and identity management"
  homepage "https://github.com/trinsic-id/okapi/"
  url "https://github.com/trinsic-id/okapi/releases/download/v1.6.0/okapi-1.6.0.tar.gz"
  sha256 "2f2b8d6459afdda9132c9b7bdf583e0311b3a946abb323b099150c20387f6e80"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/okapi-1.6.0"
    sha256 cellar: :any,                 big_sur:      "b094c13e461fb2ebb534de9f3b7e5a0efa3a969127c8f8e461e0fb7a3b0ed892"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "13b553e4320464091cc84d69410dae7eddaa845ef562cb6e0e2bcd6b674546df"
  end

  depends_on "rust"

  def install
    system "echo cargo build --release > build.sh"
    system "bash", "build.sh"

    if OS.linux?
      lib.install "target/release/libokapi.so"
    else
      lib.install "target/release/libokapi.dylib"
    end
    lib.install "target/release/libokapi.a"
    include.install "include/okapi.h"
  end

  test do
    # add better test
    assert_equal "42", "42"
  end
end
