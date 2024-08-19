cask "bettertouchtool_licensed" do
  version "4.645"
  sha256 :no_check

  url "https://github.com/letuanhai/homebrew-tap/releases/download/BetterTouchTool-4.645/btt4.645-46450.zip", verified: "github.com/letuanhai/homebrew-tap/"
  name "BetterTouchTool"
  desc "Tool to customise input devices and automate computer systems"
  homepage "https://folivora.ai/"

  auto_updates false
  depends_on macos: ">= :catalina"

  app "BetterTouchTool.app"

  uninstall quit: "com.hegenberg.BetterTouchTool"

  zap trash: [
    "~/Library/Application Support/BetterTouchTool",
    "~/Library/Preferences/com.hegenberg.BetterTouchTool.plist",
  ]
end
