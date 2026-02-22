class Nocrumbs < Formula
  desc "Trace every AI code change back to the prompt that caused it"
  homepage "https://nocrumbs.ai"
  url "https://github.com/geneyoo/nocrumbs/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "1679a362b66875a9450f950d76e0e990ac431257437f7ffc3d9b1978aaf31d22"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--package-path", "CLI/", "--disable-sandbox"
    bin.install "CLI/.build/release/nocrumbs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nocrumbs --version")
  end
end
