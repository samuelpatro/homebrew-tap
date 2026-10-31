cask "vibejuice" do
  version "0.4.21"
  sha256 "3892c7620d2e46880ea8c5ef1069af7c8df823ec999b6aecb98be5570d6941eb"

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
