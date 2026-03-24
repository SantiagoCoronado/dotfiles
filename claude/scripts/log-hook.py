#!/usr/bin/env python3
"""Claude Code hook logger. Reads hook JSON from stdin and appends a structured log line.

Usage in settings.json hooks:
  PreToolUse:  "command": "uv run claude/scripts/log-hook.py pre"
  PostToolUse: "command": "uv run claude/scripts/log-hook.py post"
  Stop:        "command": "uv run claude/scripts/log-hook.py stop"
"""

import json
import sys
import os
from datetime import datetime
from pathlib import Path

LOG_DIR = Path.home() / ".claude" / "logs"
LOG_DIR.mkdir(parents=True, exist_ok=True)

log_file = LOG_DIR / f"{datetime.now():%Y-%m-%d}.log"

def get_input():
    try:
        return json.load(sys.stdin)
    except (json.JSONDecodeError, EOFError):
        return {}

def extract_summary(event, data):
    tool = data.get("tool_name", "---")

    if event == "stop":
        session_id = data.get("session_id", "unknown")
        return "stop", "---", f"session ended (id: {session_id[:8]})" if session_id != "unknown" else "session ended"

    tool_input = data.get("tool_input", {})

    if event == "pre":
        if tool == "Bash":
            detail = tool_input.get("command", "")[:120]
        elif tool in ("Read", "Write"):
            detail = tool_input.get("file_path", "")
        elif tool in ("Edit", "MultiEdit"):
            detail = tool_input.get("file_path", "")
        elif tool == "Glob":
            detail = tool_input.get("pattern", "")
        elif tool == "Grep":
            detail = tool_input.get("pattern", "")[:80]
        elif tool == "Agent":
            detail = tool_input.get("description", "")[:80]
        else:
            detail = str(tool_input)[:80]
        return "PRE ", tool, detail

    if event == "post":
        tool_output = data.get("tool_output", "")
        if tool == "Bash":
            exit_code = data.get("exit_code", "?")
            detail = f"exit:{exit_code}"
        elif tool in ("Edit", "MultiEdit", "Write"):
            detail = "ok" if "success" in str(tool_output).lower() else "done"
        else:
            detail = "ok"
        return "POST", tool, detail

    return event.upper(), tool, ""

def main():
    event = sys.argv[1] if len(sys.argv) > 1 else "unknown"
    data = get_input()
    tag, tool, detail = extract_summary(event, data)
    timestamp = datetime.now().strftime("%H:%M:%S")

    line = f"[{timestamp}] {tag:<4} {tool:<15} {detail}\n"

    with open(log_file, "a") as f:
        f.write(line)

if __name__ == "__main__":
    main()
