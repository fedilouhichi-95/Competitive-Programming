#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 3 ]; then
    echo "Usage: ./scripts/submit.sh <lang> <name> <contest_id>"
    echo ""
    echo "  Copies solution to clipboard and opens Codeforces submit page."
    echo ""
    echo "Examples:"
    echo "  ./scripts/submit.sh cpp 2050A 2050"
    echo "  make submit LANG=cpp NAME=2050A CONTEST=2050"
    exit 1
fi

LANG="$1"
NAME="$2"
CONTEST="$3"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/$LANG/$NAME"
PROBLEM="${NAME: -1}"

if [ "$LANG" = "cpp" ]; then
    FILE="$DIR/main.cpp"
elif [ "$LANG" = "c" ]; then
    FILE="$DIR/main.c"
else
    echo "❌ Error: lang must be 'c' or 'cpp'"
    exit 1
fi

if [ ! -f "$FILE" ]; then
    echo "❌ Error: $FILE not found"
    exit 1
fi

cd "$ROOT"
python3 scripts/cf_submit.py "$CONTEST" "$PROBLEM" "$FILE"
