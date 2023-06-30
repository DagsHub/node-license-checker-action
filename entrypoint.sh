#!/bin/bash
set -e

script_dir="$(dirname "$0")"
default_allowed_licenses="$script_dir/allowed-licenses.txt"

# Default to file if not specified
ALLOWED_LICENSES="${ALLOWED_LICENSES:-$(cat $default_allowed_licenses | tr '\n' ','| sed 's/,$//')}"
echo "Allowed licenses: $ALLOWED_LICENSES"

TARGET_DIR=${TARGET_DIR:-.}
cd "$TARGET_DIR"

ALL_OUTPUT_FILE="${ALL_OUTPUT_FILE:-licenses.csv}"
DISALLOWED_OUTPUT_FILE="${DISALLOWED_OUTPUT_FILE:-disallowed-licenses.csv}"
license-checker-rseidelsohn ${*:---summary --unknown --nopeer --csv} | tee "$ALL_OUTPUT_FILE"
license-checker-rseidelsohn ${*:---summary --unknown --nopeer --csv --excludeLicenses "$ALLOWED_LICENSES"} > "$DISALLOWED_OUTPUT_FILE"

line_count=$(wc -l < "$DISALLOWED_OUTPUT_FILE")
if [ "$line_count" -gt 1 ]; then
    echo "Dangerous dependencies found"
    cat "$DISALLOWED_OUTPUT_FILE"
    exit 1
fi
