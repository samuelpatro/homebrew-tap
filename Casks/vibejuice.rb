cask "vibejuice" do
  version "0.4.18"
  sha256 "35bf52fa3e1233c261c52d519cf01ea87b2bbd4b95ddf1706dc032a594f9d993"

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
