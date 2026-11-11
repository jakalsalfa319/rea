#!/usr/bin/env bash
# Run only inside a disposable Codespace/devcontainer, not on a production host.
set -euo pipefail
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$LAB_DIR/.reports"

# REA 6.7.0 requires Node 24.22.1+ (or a sufficiently recent supported 22/26).
if ! node -e 'const [major, minor, patch] = process.versions.node.split(".").map(Number); process.exit(major === 24 && (minor > 22 || (minor === 22 && patch >= 1)) ? 0 : 1)' 2>/dev/null; then
  NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
  if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    # shellcheck source=/dev/null
    source "$NVM_DIR/nvm.sh"
    nvm install 24.22.1
    nvm alias default 24.22.1
    nvm use 24.22.1
  else
    printf 'Node %s is not supported for this lab and nvm is unavailable. Install Node 24.22.1+ before continuing.\n' "$(node --version 2>/dev/null || echo missing)" >&2
    exit 1
  fi
fi
if ! command -v ps >/dev/null; then
  echo 'Missing procps (ps). REA Linux analysis requires ps on PATH.' >&2
  exit 1
fi
printf '\nInstalling OpenCode CLI and official REA npm package...\n'
npm install --global @opencode/cli rea-agents@6.7.0
printf '\nTool versions:\n'
node --version
npm --version
opencode --version
rea --version
printf '\nWriting read-only REA setup plan for OpenCode...\n'
rea setup --client opencode --dry-run --json > "$LAB_DIR/.reports/rea-setup-plan.json"
printf 'Plan saved at %s/.reports/rea-setup-plan.json\n' "$LAB_DIR"
printf 'Review that plan and then run: rea setup --client opencode\n'
printf 'After setup, restart OpenCode and run: bash lab/smoke.sh\n'
