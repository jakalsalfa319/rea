#!/usr/bin/env bash
set -euo pipefail
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$LAB_DIR/.reports"

printf '1/4 Checking binaries...\n'
command -v node
command -v opencode
command -v rea
node --version
opencode --version
rea --version

printf '\n2/4 Testing owned demo fixture...\n'
node --test "$LAB_DIR/fixture-app/test.mjs"

printf '\n3/4 Inspecting the owned demo fixture with REA...\n'
rea analyze-javascript-application "$LAB_DIR/fixture-app" --json > "$LAB_DIR/.reports/fixture-evidence.json"
node -e 'const fs=require("node:fs");const data=JSON.parse(fs.readFileSync(process.argv[1],"utf8"));if(!data||typeof data!=="object")process.exit(1);console.log("Valid JSON evidence report produced.")' "$LAB_DIR/.reports/fixture-evidence.json"

printf '\n4/4 Inspecting OpenCode MCP readiness...\n'
if rea doctor --client opencode --json > "$LAB_DIR/.reports/opencode-doctor.json"; then
  echo 'OpenCode REA doctor passed.'
else
  echo 'OpenCode REA doctor reports missing configuration/provider(s). Inspect .reports/opencode-doctor.json' >&2
  exit 1
fi
printf '\nPASS: The controlled REA/OpenCode smoke check completed.\n'
