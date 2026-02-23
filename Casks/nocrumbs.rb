cask "nocrumbs" do
  version "0.4.9"
  sha256 "571e0e571abb11e0273ab472e87a8c849dca2f70fdc4a5b9f33238328c137d08"

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
