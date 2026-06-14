# AGENTS.md

This folder is a **PlutoSpace workspace**. A human may have it open in a browser right now,
with notebooks running in a live lazy-mode session. You can work in that same session using
nothing but your normal file tools and a shell.

## Pluto notebooks (live collaborative sessions)

Notebooks (`*.jl` with Pluto cell markers, e.g. everything in `notebooks/`) may be OPEN in a
live lazy-mode Pluto server.

- Edit notebook files directly with your file tools. Edits only mark cells **stale** — nothing
  runs until requested, and the human sees staleness live in their browser.
- `pluto-collab status <nb.jl>` shows per-cell state and outputs.
- `pluto-collab run <nb.jl> --stale` runs exactly what's outdated (blocking; exit 1 if a
  cell errors). **Never re-run the whole notebook.**
- All cell outputs are also in `<nb.jl>.pluto-cache.toml` (plain TOML; a deletable cache) —
  you can read results without running anything.
- Cell ids are the UUIDs in `# ╔═╡ <uuid>` markers. Keep the `# ╔═╡ Cell order:` section in
  sync when adding/removing cells.

## Discovery

- Live servers each write `~/.local/state/pluto/servers/<port>.json` (port + access secret).
- `pluto-collab` (curl + sed) finds them for you:
  `pluto-collab servers`, `pluto-collab notebooks`, `pluto-collab status`, `pluto-collab run`,
  `pluto-collab interrupt`.
- The CLI ships with PlutoSpace: `bin/pluto-collab` in the
  [PlutoSpace.jl repo](https://github.com/GroupTherapyOrg/PlutoSpace.jl).

## A good first task to demo

`notebooks/04_agent_collab.jl` is built for this. Change `target_temperature` in that file,
then `pluto-collab run notebooks/04_agent_collab.jl --stale`, and watch the human's browser
go amber → running → green in real time.
