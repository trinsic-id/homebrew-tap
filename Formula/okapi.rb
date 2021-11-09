class Okapi < Formula
  desc "Collection of tools that support workflows for authentic data and identity management. Libraries available in most languages."
  homepage ""
  url "https://github.com/trinsic-id/okapi/releases/download/v1.1.0/okapi-1.1.0.tar.gz"
  sha256 "3fcdfa1f513b934981812c917b2053dbb4acca955f98e94ee717855e3300523d"
  license "Apache-2.0"

  depends_on "rust"

  def install
    system "cargo", "build", "--release"

    if OS.linux?
      lib.install "target/release/libokapi.so"
    else
      lib.install "target/release/libokapi.dylib"
    end
    include.install "include/okapi.h"
  end

  test do
    # add better test
    assert_equal "42", "42"
  end
end
