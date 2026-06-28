#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: ./scripts/test.sh <lang> <name>"
    exit 1
fi

LANG="$1"
NAME="$2"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/$LANG/$NAME"

if [ ! -f "$DIR/Output.txt" ]; then
    echo "❌ Error: $DIR/Output.txt not found. Run the solution first."
    exit 1
fi

if [ ! -f "$DIR/Expected.txt" ] || [ ! -s "$DIR/Expected.txt" ]; then
    echo "⚠️  Expected.txt is empty or missing. Write the expected output first."
    exit 1
fi

echo "🔍 Comparing Output.txt vs Expected.txt..."
echo ""

if diff --color=always "$DIR/Expected.txt" "$DIR/Output.txt" > /dev/null 2>&1; then
    echo "✅ PASS — Output matches expected!"
else
    echo "❌ FAIL — Output differs from expected:"
    echo ""
    diff --color=always "$DIR/Expected.txt" "$DIR/Output.txt" || true
    exit 1
fi
