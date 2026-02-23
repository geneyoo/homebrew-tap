cask "nocrumbs" do
  version "0.4.2"
  sha256 "5bba198a7b9f03495d509de0930387f5233ec29a67aae8c38175ac1ec4457bbb"

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
