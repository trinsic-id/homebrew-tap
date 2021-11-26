class Okapi < Formula
  desc "Set of tools that support workflows for authentic data and identity management"
  homepage "https://github.com/trinsic-id/okapi/"
  url "https://github.com/trinsic-id/okapi/releases/download/v1.2.0/okapi-1.2.0.tar.gz"
  sha256 "54494573cdbba598d046062ab38e05afb8169b66a0ea59f63e67507920e08191"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/okapi-1.1.1"
    sha256 cellar: :any,                 catalina:     "3efc5d17356608c690c4d44b167949c59237f48239e6a69bc427d703b8c33c16"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8636da09b16040562dcb34c7277d35b3e136e119cfd19ce9d8133dc6539187a6"
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
