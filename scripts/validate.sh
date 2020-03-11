#!/usr/bin/env bash

set -eu

cd "$(dirname "$0")/.."

for file in tests/*; do
  filepath=$(mktemp)
  if cat <(circleci config pack src) "$file" | circleci config validate - > "$filepath" 2>&1; then
    continue
  else
    COLOR_1="\e[31;1m"
    COLOR_OFF="\e[m"
    echo "${COLOR_1}$file is failed${COLOR_OFF}" >&2
    echo "$filepath" >&2
    exit 1
  fi
done
