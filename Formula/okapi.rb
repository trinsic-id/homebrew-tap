class Okapi < Formula
  desc "Set of tools that support workflows for authentic data and identity management"
  homepage "https://github.com/trinsic-id/okapi/"
  url "https://github.com/trinsic-id/okapi/releases/download/v1.2.0/okapi-1.2.0.tar.gz"
  sha256 "54494573cdbba598d046062ab38e05afb8169b66a0ea59f63e67507920e08191"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/trinsic-id/homebrew-tap/releases/download/okapi-1.2.0"
    sha256 cellar: :any,                 catalina:     "e56756e31e07ce3556a1f969c14ad7857882053d886d35833b573cfcea34350e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d010b687c63ae5e5fe20a41bf8aa0b60beb8a61054763b2f644c8fdda5a1f419"
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
