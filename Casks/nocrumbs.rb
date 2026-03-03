cask "nocrumbs" do
  version "0.5.7"
  sha256 "da411d33bef16b4d992b9daca297f752683e0809988d122c5e7e9fa235c11b70"

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
