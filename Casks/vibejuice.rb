cask "vibejuice" do
  version "0.4.13"
  sha256 "9110b6c8c22048f253f53d34fb8f19a34be0c875e62449968538c4c99ecef52e"

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
