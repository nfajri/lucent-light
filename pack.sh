#!/bin/bash
# Pack Lucent Light resource pack into .mcpack for mobile installation
#
# Usage: ./pack.sh
# Output: Lucent-Light-v1.0.0.mcpack

PACK_NAME="Lucent-Light"
VERSION="v1.0.0"
OUTPUT="${PACK_NAME}-${VERSION}.mcpack"

# Clean previous build
rm -f "$OUTPUT"

# Create .mcpack (zip archive with all pack files, excluding dev/git files)
zip -r "$OUTPUT" \
  manifest.json \
  pack_icon.png \
  atmospherics/ \
  color_grading/ \
  lighting/ \
  pbr/ \
  point_lights/ \
  shadows/ \
  water/ \
  -x "*.git*" "pack.sh" "*.mcpack"

echo ""
echo "=== Pack created: $OUTPUT ==="
echo ""
echo "Cara install di HP:"
echo "  1. Transfer file '$OUTPUT' ke HP kamu"
echo "  2. Tap/buka file tersebut — Minecraft akan otomatis mengimport"
echo "  3. Buka Minecraft > Settings > Global Resources > aktifkan 'Lucent Light'"
echo ""
echo "Catatan: Pack ini membutuhkan Minecraft Bedrock Edition v1.21.80+"
echo "         dan perangkat yang mendukung Deferred Rendering (PBR)."
