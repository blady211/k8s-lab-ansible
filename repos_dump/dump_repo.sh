#!/bin/bash

OUTPUT="repo_full_dump.txt"

# tworzenie dumpa
(
echo "================ STRUCTURE ================"
tree -a

echo
echo "================ FILE CONTENT ================"

find . -type f ! -path "./.git/*" ! -name "$OUTPUT" | while read file; do
    echo
    echo "########## $file ##########"
    cat "$file"
done
) > "$OUTPUT"

# podział na 4 równe części
LINES=$(wc -l < "$OUTPUT")
PART=$((LINES / 4 + 1))

split -l $PART "$OUTPUT" repo_part_

echo "Utworzone pliki:"
ls repo_part_*
