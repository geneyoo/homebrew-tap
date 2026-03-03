cask "nocrumbs" do
  version "0.5.8"
  sha256 "e157365680b7837c0ec1e6a9089854b8d3ffe678aaa6aa3245ee7c8366211d1d"

  url "https://github.com/geneyoo/nocrumbs/releases/download/v#{version}/NoCrumbs-#{version}.zip"
  name "NoCrumbs"
  desc "Catch every crumb your agent leaves behind"
  homepage "https://nocrumbs.ai/"

  depends_on macos: ">= :sonoma"

  app "NoCrumbs.app"
  binary "#{appdir}/NoCrumbs.app/Contents/Resources/nocrumbs"

  preflight do
    %w[/usr/local/bin/nocrumbs /opt/homebrew/bin/nocrumbs].each do |path|
      File.delete(path) if File.symlink?(path) && !File.exist?(path)
    end
  end

  zap trash: "~/Library/Application Support/NoCrumbs"
end
