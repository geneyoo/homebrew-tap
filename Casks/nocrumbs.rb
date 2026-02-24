cask "nocrumbs" do
  version "0.5.3"
  sha256 "971ed2b973d10b548e769faed096dd6a68bab856ecbec4a770fa6cac9c6a3e88"

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
