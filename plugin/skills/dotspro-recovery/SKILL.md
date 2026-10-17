---
name: dotspro-recovery
description: Structured failure recovery without external MCP tools.
---

# DotsPro Recovery Skill

When an action fails:

1. Capture the exact error text and relevant diagnostics.
2. Classify: `transient` | `missing_resource` | `permission` | `validation` | `tool_unavailable` | `logic` | `unknown`.
3. Write a short recovery plan with bounded steps and attempt budget.
4. Do **not** repeat a failed strategy without new evidence.
5. For `permission` failures: request only the missing delta. Never bypass host approvals.
6. Update the in-thread checkpoint and evidence after each attempt.
7. Escalate only when Dot-native alternatives are exhausted, with a precise blocker.

Prefer switching to another Dot-native path (different sub-agent, local computer, different API) over escaping to Work/Codex.
