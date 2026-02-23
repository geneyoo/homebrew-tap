class Nocrumbs < Formula
  desc "Catch every crumb your agent leaves behind"
  homepage "https://nocrumbs.ai"
  url "https://github.com/geneyoo/nocrumbs/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "1b70ee54e794d13c00a48b41a9f8f2d84be8ffad4e289c3550cda5ab7bb3e280"
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
