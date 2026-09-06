cask "vibejuice" do
  version "0.4.4"
  sha256 "39c13aed52df7db73469c087046e68b79c39029bf70407b0f3c4c27830ae93b6"

  url "https://github.com/samuelpatro/vibejuice/releases/download/v#{version}/VibeJuice-#{version}.dmg"
  name "VibeJuice"
  desc "One-click account switcher for Claude Code, Codex CLI and Grok CLI"
  homepage "https://github.com/samuelpatro/vibejuice"

  depends_on macos: :tahoe

  # Unsigned build: drop the quarantine flag before install so Gatekeeper does not block it.
  preflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{staged_path}/VibeJuice.app"]
  end

  app "VibeJuice.app"

  zap trash: [
    "~/Library/Application Support/VibeJuice",
    "~/Library/Logs/VibeJuice",
    "~/Library/Preferences/dev.samuel.vibejuice.plist",
  ]
end
