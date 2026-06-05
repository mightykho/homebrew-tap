class ClaudeJam < Formula
  desc "Fancy tmux window switcher and TUI dashboard for modern agentic workflows"
  homepage "https://github.com/mightykho/claude-jam"
  url "https://github.com/mightykho/claude-jam/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "e97409ff56c0ce3608456d74c96c152a29df0e740c9b94a38ec0db56a8839e6f"
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
