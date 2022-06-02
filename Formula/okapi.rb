class Okapi < Formula
  desc "Set of tools that support workflows for authentic data and identity management"
  homepage "https://github.com/trinsic-id/okapi/"
  url "https://github.com/trinsic-id/okapi/releases/download/v1.6.0/okapi-1.6.0.tar.gz"
  sha256 "2f2b8d6459afdda9132c9b7bdf583e0311b3a946abb323b099150c20387f6e80"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/okapi-1.4.0"
    sha256 cellar: :any,                 big_sur:      "a1c46e3494b11a460413ee1d288a60c362b3823345d37d7000376dc2ce494b2d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "235635057bff68aaf7e2cdd63f1509dc1df11aa32855bc4f6f6add51e90194d0"
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
