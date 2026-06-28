#!/usr/bin/env bash
set -euo pipefail

# ─── Usage ───────────────────────────────────────────────────
if [ $# -lt 2 ]; then
    echo "Usage: ./scripts/new.sh <lang> <name>"
    echo "  lang: c | cpp"
    echo "  name: problem name (e.g. 2050A)"
    exit 1
fi

LANG="$1"
NAME="$2"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIR="$ROOT/$LANG/$NAME"

if [[ "$LANG" != "c" && "$LANG" != "cpp" ]]; then
    echo "❌ Error: lang must be 'c' or 'cpp'"
    exit 1
fi

if [ -d "$DIR" ]; then
    echo "❌ Error: $DIR already exists"
    exit 1
fi

mkdir -p "$DIR"

# ─── Copy template ───────────────────────────────────────────
if [ "$LANG" = "cpp" ]; then
    cp "$ROOT/templates/template.cpp" "$DIR/main.cpp"
    EXT="cpp"
    STD_VAR="CMAKE_CXX_STANDARD"
    STD_VAL="17"
    LANG_OPT=""
else
    cp "$ROOT/templates/template.c" "$DIR/main.c"
    EXT="c"
    STD_VAR="CMAKE_C_STANDARD"
    STD_VAL="11"
    LANG_OPT=" C"
fi

TARGET="${LANG}_${NAME}"

# ─── CMakeLists.txt ──────────────────────────────────────────
cat > "$DIR/CMakeLists.txt" << EOF
cmake_minimum_required(VERSION 3.10)
project(${TARGET}${LANG_OPT})

set(${STD_VAR} ${STD_VAL})
set(${STD_VAR}_REQUIRED ON)

option(ENABLE_DEBUG "Enable debug macros" OFF)
if(ENABLE_DEBUG)
    add_definitions(-DDEBUG)
endif()

add_executable(${TARGET} main.${EXT})
target_compile_options(${TARGET} PRIVATE -Wall -Wextra -Wshadow)
EOF

# ─── I/O files ───────────────────────────────────────────────
touch "$DIR/Input.txt" "$DIR/Output.txt" "$DIR/Expected.txt" "$DIR/Error.txt"

echo "✅ Created $LANG problem: $DIR"
echo ""
echo "  📝 Edit:    $DIR/main.$EXT"
echo "  📥 Input:   $DIR/Input.txt"
echo "  ▶  Run:     ./scripts/run.sh $LANG $NAME"
echo "  🐛 Debug:   ./scripts/debug.sh $LANG $NAME"
echo "  ✔  Test:    ./scripts/test.sh $LANG $NAME"
