# HEARTBEAT.md — Rotating Check System

On each heartbeat tick, read `memory/heartbeat-state.json`, find the most overdue eligible check, run it, update the timestamp, and report only if something is actionable. If nothing needs attention, reply `HEARTBEAT_OK`.

## Checks

| Check | Cadence | Time Window | What to Do |
|-------|---------|-------------|------------|
| Email | 30 min | 09:00–21:00 | Check for urgent unread messages. Flag anything important. |
| Calendar | 2 hours | 08:00–22:00 | Upcoming events in next 24–48h. Notify if <2h away. |
| Git status | 24 hours | any | Run `git status` on workspace. Commit/push if clean changes exist. |
| Memory maintenance | 24 hours | any | Review recent `memory/YYYY-MM-DD.md` files. Update `MEMORY.md` with distilled learnings. Remove outdated entries. |
| Proactive scans | 24 hours | 03:00 only | Check project health, stale TODOs, documentation drift. |

## Rules

1. **One check per tick.** Pick the most overdue eligible check (respecting time windows).
2. **Cheap model only.** Heartbeat runs on the cheapest available model. If a check finds real work, spawn an agent — don't do it inline.
3. **Update state after every check.** Write the new timestamp to `memory/heartbeat-state.json`.
4. **Quiet hours:** 23:00–08:00 — only check if something is marked urgent.
5. **Don't repeat.** If you just checked something <30 min ago, skip it even if it's "most overdue."

## State File

Track last-run timestamps in `memory/heartbeat-state.json`:

```json
{
  "lastChecks": {
    "email": null,
    "calendar": null,
    "git_status": null,
    "memory_maintenance": null,
    "proactive_scans": null
  }
}
```

## Adding New Checks

To add a check: add a row to the table above and a key to the state file. Keep this file small — token burn matters on heartbeat ticks.
