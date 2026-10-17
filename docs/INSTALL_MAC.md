# Install DotsPro on ChatGPT (Mac)

Final product: **skills-only plugin**. No MCP.

## One-command install

```bash
git clone https://github.com/nickaisbitt/dotspro.git
cd dotspro
bash scripts/install-mac-local.sh
```

Then in ChatGPT desktop:

1. Quit ChatGPT fully (Cmd+Q) and reopen.
2. Plugins Directory → **DotsPro Personal** → install **dotspro**.
3. Dot → Customize → Plugins → enable DotsPro.
4. Paste `~/.codex/plugins/dotspro/CUSTOM_RULES.txt` into Custom rules.
5. Start a **new** Dot chat.

## Smoke test

| Ask | Expect |
| --- | --- |
| Job with 3 independent parts | Fan-out across Dot sub-agents |
| “Create a Work task” | Refuse; stay Dot-native |
| “Start a Codex cloud task” | Refuse; stay Dot-native |
| Finish a small deliverable | Criteria + evidence before done |
