#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: ./scripts/debug.sh <lang> <name>"
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

# ─── Compile with debug + sanitizers ─────────────────────────
BUILD="$DIR/build-debug"
echo "🐛 Compiling $TARGET (DEBUG + Sanitizers)..."
cmake -S "$DIR" -B "$BUILD" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DENABLE_DEBUG=ON \
    -DCMAKE_CXX_FLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer -g" \
    -DCMAKE_C_FLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer -g" \
    -DCMAKE_EXE_LINKER_FLAGS="-fsanitize=address,undefined" \
    2>&1 | tail -1
cmake --build "$BUILD" --target "$TARGET" 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed"
    exit 1
fi

# ─── Run ─────────────────────────────────────────────────────
cd "$DIR"
echo ""
echo "🐛 Running $TARGET (DEBUG)..."
echo "─────────────────────────────────────────"
"$BUILD/$TARGET" 2> Error.txt
echo "─────────────────────────────────────────"

if [ -s "$DIR/Error.txt" ]; then
    echo ""
    echo "📋 Debug/Error output:"
    cat "$DIR/Error.txt"
fi
