---
name: dotspro-routing
description: Rank Dot manager + sub-agents first; prefer APIs/files before cloud browser; ban Work/Codex.
---

# DotsPro Tool / Agent Routing

Order of preference (always):

1. **Dot manager + built-in sub-agents** (fan out independent work)
2. **API / connectors** already available to the Dot
3. **Structured files / exports**
4. **Local computer** (if connected) when cloud browser is blocked
5. **Cloud browser** last among Dot-native automation
6. **Ask user** only after Dot-native options are exhausted or auth/safety requires it

## Banned under `dot_native_only`

- ChatGPT Work sessions/tasks
- Codex local or cloud tasks

Unless the user **explicitly** requests them.

## Rules

1. Plan routing before jumping to computer-use.
2. On cloud browser blocks (captcha, Error 9, site ban), try local computer if connected — do not silently stall.
3. Check official docs/capabilities before claiming impossibility.
4. Never invent tools. Never claim a tool was used without using it.
5. If browser already failed once, do not blind-retry the same path.
