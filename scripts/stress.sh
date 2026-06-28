#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 3 ]; then
    echo "Usage: ./scripts/stress.sh <lang> <name> <iterations>"
    echo ""
    echo "Requires: gen.cpp (or gen.c) and brute.cpp (or brute.c) in the problem dir"
    echo "  gen    → generates random input to stdout"
    echo "  brute  → brute-force correct solution"
    echo "  main   → optimized solution to test"
    exit 1
fi

LANG="$1"
NAME="$2"
ITER="$3"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/$LANG/$NAME"
BUILD="$DIR/build"

if [ ! -d "$DIR" ]; then
    echo "❌ Error: $DIR not found"
    exit 1
fi

TARGET="${LANG}_${NAME}"

# ─── Compile all three ───────────────────────────────────────
if [ "$LANG" = "cpp" ]; then
    EXT="cpp"
    STD="-std=c++17"
else
    EXT="c"
    STD="-std=c11"
fi

echo "🔨 Compiling gen, brute, main..."
g++ $STD -O2 -o "$DIR/gen_bin" "$DIR/gen.$EXT" 2>&1 || { echo "❌ gen.$EXT compilation failed"; exit 1; }
g++ $STD -O2 -o "$DIR/brute_bin" "$DIR/brute.$EXT" 2>&1 || { echo "❌ brute.$EXT compilation failed"; exit 1; }
cmake -S "$DIR" -B "$BUILD" -DCMAKE_BUILD_TYPE=Release 2>&1 | tail -1
cmake --build "$BUILD" --target "$TARGET" 2>&1

echo ""
echo "🔄 Stress testing ($ITER iterations)..."
echo ""

for (( i=1; i<=ITER; i++ )); do
    "$DIR/gen_bin" $i > "$DIR/Input.txt"
    
    cd "$DIR"
    "$BUILD/$TARGET" > "$DIR/Output.txt" 2>/dev/null
    "$DIR/brute_bin" < "$DIR/Input.txt" > "$DIR/Expected.txt" 2>/dev/null
    cd "$ROOT"
    
    if ! diff -q "$DIR/Output.txt" "$DIR/Expected.txt" > /dev/null 2>&1; then
        echo "❌ MISMATCH on test $i!"
        echo ""
        echo "── Input ──"
        cat "$DIR/Input.txt"
        echo ""
        echo "── Expected (brute) ──"
        cat "$DIR/Expected.txt"
        echo ""
        echo "── Got (main) ──"
        cat "$DIR/Output.txt"
        exit 1
    fi
    
    printf "\r✅ Passed %d/%d" "$i" "$ITER"
done

echo ""
echo "🎉 All $ITER tests passed!"
