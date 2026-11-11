cask "vibejuice" do
  version "0.4.23"
  sha256 "5d504b7b38455395265c2c5ba02037e2c60e8c158df3d962aebdb14c47f186b4"

  url "https://github.com/samuelpatro/vibejuice/releases/download/v#{version}/VibeJuice-#{version}.dmg"
  name "VibeJuice"
  desc "One-click account switcher for Claude Code, Codex CLI and Grok CLI"
  homepage "https://github.com/samuelpatro/vibejuice"

  depends_on macos: :tahoe

  app "VibeJuice.app"

  # Unsigned build: drop the quarantine flag before install so Gatekeeper does not block it.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/VibeJuice.app"]
  end

  zap trash: [
    "~/Library/Application Support/VibeJuice",
    "~/Library/Logs/VibeJuice",
    "~/Library/Preferences/dev.samuel.vibejuice.plist",
  ]
end
