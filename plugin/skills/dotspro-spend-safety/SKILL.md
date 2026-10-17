---
name: dotspro-spend-safety
description: Watch for silent background spend and host Pause gaps; never authorize purchases.
---

# DotsPro Spend Safety

Silent background spend is a top Dot failure mode. DotsPro (skills-only) cannot stop the host process, but must make burn visible and refuse to drive consequential actions blindly.

1. Track meaningful tool bursts, browser time, and any purchase attempt in heartbeats.
2. Before costly loops, assess budget risk; if spend looks runaway, stop initiating new expensive work and notify the user.
3. Never treat DotsPro guidance as payment authorization. Host approvals still apply.
4. If Pause seems ineffective: tell the user to stop Activity tasks and Scheduled jobs separately — DotsPro cannot force host Pause.
5. For takeover/viewer freezes: do not claim DotsPro can fix CDP viewer bugs; switch Dot-native paths or escalate precisely.
