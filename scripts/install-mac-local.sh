#!/usr/bin/env bash
# Install DotsPro into the personal ChatGPT/Codex local marketplace on macOS.
# Run this on your Mac from the repo root (or pass the plugin directory).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PLUGIN_SRC="${1:-$ROOT/plugin}"
DEST="${HOME}/.codex/plugins/dotspro"
MARKETPLACE_DIR="${HOME}/.agents/plugins"
MARKETPLACE="${MARKETPLACE_DIR}/marketplace.json"

if [[ ! -f "${PLUGIN_SRC}/plugin.json" ]]; then
  echo "Missing plugin.json at ${PLUGIN_SRC}" >&2
  exit 1
fi
if [[ ! -d "${PLUGIN_SRC}/skills" ]]; then
  echo "Missing skills/ at ${PLUGIN_SRC}" >&2
  exit 1
fi

mkdir -p "${HOME}/.codex/plugins" "${MARKETPLACE_DIR}"
rm -rf "${DEST}"
cp -R "${PLUGIN_SRC}" "${DEST}"
rm -f "${DEST}/mcp.json" "${DEST}/.mcp.json" 2>/dev/null || true

export DOTSPRO_MARKETPLACE="${MARKETPLACE}"
export DOTSPRO_DEST="${DEST}"
python3 <<'PY'
import json, os
from pathlib import Path

market_path = Path(os.environ["DOTSPRO_MARKETPLACE"])
plugin_dest = Path(os.environ["DOTSPRO_DEST"]).resolve()
home = Path.home().resolve()
try:
    rel = "./" + str(plugin_dest.relative_to(home))
except ValueError:
    rel = str(plugin_dest)

entry = {
    "name": "dotspro",
    "source": {"source": "local", "path": rel},
    "policy": {
        "installation": "AVAILABLE",
        "authentication": "ON_INSTALL",
    },
    "category": "Productivity",
}

if market_path.exists():
    data = json.loads(market_path.read_text())
else:
    data = {
        "name": "dotspro-personal",
        "interface": {"displayName": "DotsPro Personal"},
        "plugins": [],
    }

plugins = [p for p in data.get("plugins", []) if p.get("name") != "dotspro"]
plugins.append(entry)
data["plugins"] = plugins
data.setdefault("name", "dotspro-personal")
data.setdefault("interface", {"displayName": "DotsPro Personal"})
market_path.write_text(json.dumps(data, indent=2) + "\n")
print(f"Wrote {market_path}")
print(f"Plugin path entry: {rel}")
PY

echo ""
echo "Installed DotsPro to: ${DEST}"
echo "Marketplace: ${MARKETPLACE}"
echo ""
echo "Next on your Mac:"
echo "  1. Quit ChatGPT desktop fully (Cmd+Q) and reopen."
echo "  2. Plugins Directory → DotsPro Personal → install dotspro."
echo "  3. Dot → Customize → Plugins → enable DotsPro."
echo "  4. Paste rules from: ${DEST}/CUSTOM_RULES.txt"
echo "  5. New Dot chat → smoke checks in docs/INSTALL_MAC.md"
