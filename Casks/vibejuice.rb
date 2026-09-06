cask "vibejuice" do
  version "0.4.0"
  sha256 "288ce25af2a04fe3a0b36a48d7841ed62e41f7fee0f787bbf34058c5b31a0fc5"

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
