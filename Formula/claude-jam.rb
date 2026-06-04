class ClaudeJam < Formula
  desc "Fancy tmux window switcher and TUI dashboard for modern agentic workflows"
  homepage "https://github.com/mightykho/claude-jam"
  url "https://github.com/mightykho/claude-jam/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "2f0bcd1177c6996d27d19cc4b17af0ee7d59bde4adf4aeeef166d6e113d63a50"
  license "MIT"
  head "https://github.com/mightykho/claude-jam.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  def caveats
    <<~EOS
      To finish wiring Claude Jam into Claude Code, run once:

        cj setup

      This registers hooks under ~/.claude/settings.json, grants the
      Bash(cj:*) permission, and appends a one-line instruction to
      ~/.claude/CLAUDE.md. The command is idempotent.

      To reverse it later:

        cj teardown
    EOS
  end

  test do
    assert_match "Claude Jam", shell_output("#{bin}/cj --help")
    # `cj setup --check` against an empty dir should run cleanly without
    # touching the user's actual ~/.claude tree.
    ENV["CJ_CLAUDE_DIR"] = testpath/"claude"
    assert_match "would be added", shell_output("#{bin}/cj setup --check")
  end
end
