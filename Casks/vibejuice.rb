cask "vibejuice" do
  version "0.2.2"
  sha256 "4f5e7836a88ef8874d673fb94e1fac6d1b23ac08ed6df1a3d03431053ad211dd"

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
