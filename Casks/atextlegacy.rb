cask "atextlegacy" do
  version "2.40.5"
  sha256 :no_check

  url "https://github.com/letuanhai/homebrew-tap/releases/download/atextlegacy-2.40.5/aTextLegacy.dmg"
  name "aText Legacy"
  desc "Tool to replace abbreviations while typing"
  homepage "https://www.trankynam.com/atext/legacy"

  livecheck do
    url "https://www.trankynam.com/atext/changelog.mac.html"
    regex(/aText\s*v?(\d+(?:\.\d+)+)["< ]/i)
  end

  auto_updates false

  app "aText.app"

  zap trash: [
    "~/Library/Application Scripts/com.trankynam.aText",
    "~/Library/Application Support/com.trankynam.aText",
    "~/Library/Caches/com.trankynam.aText",
    "~/Library/Containers/com.trankynam.aText",
    "~/Library/Cookies/com.trankynam.aText.binarycookies",
    "~/Library/HTTPStorages/com.trankynam.aText",
    "~/Library/Preferences/com.trankynam.aText.plist",
    "~/Library/Saved Application State/com.trankynam.aText.savedState",
    "~/Library/WebKit/com.trankynam.aText",
  ]
end
