#!/usr/bin/env python3
"""Submit to Codeforces via browser integration.
Uses your Chrome browser session (where you're already logged in)
to bypass Cloudflare protection."""

import os
import shutil
import subprocess
import sys

LANGS = {
    ".cpp": 54,
    ".c":   75,
}


def main():
    if len(sys.argv) < 3:
        print("Usage: cf_submit.py <contest_id> <problem_id> [filename]")
        sys.exit(1)

    contest_id = sys.argv[1]
    problem_id = sys.argv[2].upper()

    if len(sys.argv) >= 4:
        filename = sys.argv[3]
        if not os.path.exists(filename):
            print(f"Error: {filename} not found")
            sys.exit(1)
        with open(filename) as f:
            source_code = f.read()
        ext = os.path.splitext(filename)[1].lower()
    else:
        source_code = sys.stdin.read()
        ext = ".cpp"

    lang_id = LANGS.get(ext)
    if lang_id is None:
        print(f"Unsupported extension {ext}")
        sys.exit(1)

    # Copy to clipboard
    copied = False
    if shutil.which("xclip"):
        proc = subprocess.run(
            ["xclip", "-selection", "clipboard"],
            input=source_code.encode(), capture_output=True,
        )
        copied = proc.returncode == 0
    elif shutil.which("xsel"):
        proc = subprocess.run(
            ["xsel", "--clipboard"],
            input=source_code.encode(), capture_output=True,
        )
        copied = proc.returncode == 0
    elif shutil.which("wl-copy"):
        proc = subprocess.run(
            ["wl-copy"],
            input=source_code.encode(), capture_output=True,
        )
        copied = proc.returncode == 0

    lang_name = "GNU G++20 13.2 (64 bit)" if ext == ".cpp" else "GNU GCC C11 5.1.0"

    print("=" * 60)
    print("📤 SUBMIT TO CODEFORCES")
    print("=" * 60)
    print(f"  Contest : {contest_id}")
    print(f"  Problem : {problem_id}")
    print(f"  File    : {filename}")
    print(f"  Lang    : {lang_name}")
    print()

    if copied:
        print("✅ Code copied to clipboard!")
    else:
        print("⚠️  Install xclip: sudo apt install xclip")
        print("   (fallback: select all and Ctrl+C manually)")
    print()

    url = f"https://codeforces.com/contest/{contest_id}/submit"
    print("🌐 Opening browser...")
    print(f"   {url}")
    print()
    print("👉 Paste (Ctrl+V) into the source editor")
    print(f"👉 Select language: {lang_name}")
    print("👉 Click Submit")
    print("=" * 60)

    subprocess.run(["xdg-open", url], check=False)


if __name__ == "__main__":
    main()
