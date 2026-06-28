#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: ./scripts/run.sh <lang> <name>"
    exit 1
fi

LANG="$1"
NAME="$2"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/$LANG/$NAME"
TARGET="${LANG}_${NAME}"

if [ ! -d "$DIR" ]; then
    echo "❌ Error: $DIR not found"
    exit 1
fi

# ─── Compile ─────────────────────────────────────────────────
BUILD="$DIR/build"
echo "🔨 Compiling $TARGET..."
cmake -S "$DIR" -B "$BUILD" -DCMAKE_BUILD_TYPE=Release 2>&1 | tail -1
cmake --build "$BUILD" --target "$TARGET" 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed"
    exit 1
fi

# ─── Run ─────────────────────────────────────────────────────
cd "$DIR"
echo ""
echo "▶  Running $TARGET..."
echo "─────────────────────────────────────────"
START=$(date +%s%N)
"$BUILD/$TARGET" 2> Error.txt
END=$(date +%s%N)
ELAPSED=$(( (END - START) / 1000000 ))
echo "─────────────────────────────────────────"
echo "⏱  Time: ${ELAPSED}ms"

# ─── Show errors if any ──────────────────────────────────────
if [ -s "$DIR/Error.txt" ]; then
    echo ""
    echo "⚠️  Stderr output (Error.txt):"
    cat "$DIR/Error.txt"
fi
