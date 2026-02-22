class Nocrumbs < Formula
  desc "Trace every AI code change back to the prompt that caused it"
  homepage "https://nocrumbs.ai"
  url "https://github.com/geneyoo/nocrumbs/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
