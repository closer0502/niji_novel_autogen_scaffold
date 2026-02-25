#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  ./scripts/new_fic.sh <new_project_path> [source_project_or_references_path]

Examples:
  ./scripts/new_fic.sh ../my_fic
  ./scripts/new_fic.sh ../my_fic ../existing_fic
  ./scripts/new_fic.sh ../my_fic ../canon_pack/references

Behavior:
  - Creates a new project from this scaffold (excluding .git).
  - If second argument is provided, copies references/canon from source.
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ $# -lt 1 || $# -gt 2 ]]; then
  usage
  exit 1
fi

if ! command -v rsync >/dev/null 2>&1; then
  echo "Error: rsync is required." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCAFFOLD_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
TARGET_RAW="$1"
TARGET_DIR="$(realpath -m "${TARGET_RAW}")"
SOURCE_RAW="${2:-}"

if [[ -e "${TARGET_DIR}" ]]; then
  echo "Error: target already exists: ${TARGET_DIR}" >&2
  exit 1
fi

if [[ "${TARGET_DIR}" == "${SCAFFOLD_ROOT}" || "${TARGET_DIR}" == "${SCAFFOLD_ROOT}/"* ]]; then
  echo "Error: target must be outside scaffold root: ${SCAFFOLD_ROOT}" >&2
  exit 1
fi

mkdir -p "${TARGET_DIR}"
rsync -a \
  --exclude ".git/" \
  --exclude ".git" \
  "${SCAFFOLD_ROOT}/" "${TARGET_DIR}/"

if [[ -n "${SOURCE_RAW}" ]]; then
  SOURCE_DIR="$(realpath -m "${SOURCE_RAW}")"
  if [[ -d "${SOURCE_DIR}/references/canon" ]]; then
    SOURCE_CANON="${SOURCE_DIR}/references/canon/"
  elif [[ -d "${SOURCE_DIR}/canon" ]]; then
    SOURCE_CANON="${SOURCE_DIR}/canon/"
  else
    echo "Error: source must contain references/canon or canon: ${SOURCE_DIR}" >&2
    exit 1
  fi

  mkdir -p "${TARGET_DIR}/references/canon"
  rsync -a --delete "${SOURCE_CANON}" "${TARGET_DIR}/references/canon/"
fi

echo "Created: ${TARGET_DIR}"
if [[ -n "${SOURCE_RAW}" ]]; then
  echo "Copied canon references from: ${SOURCE_RAW}"
else
  echo "Using default scaffold references/canon template."
fi
