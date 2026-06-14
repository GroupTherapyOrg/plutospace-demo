# PlutoSpace demo workspace 🟢🟣🔴

A self-contained, **local-only** folder built to show off every feature that's *unique to*
[PlutoSpace.jl](https://github.com/GroupTherapyOrg/PlutoSpace.jl) — the workspace, the tabs, the
terminal, SSH remotes, and the lazy human+agent reactive model. Open it, screenshot it, record
it.

## Launch

From the PlutoSpace.jl checkout (so `plutospace` / `PlutoSpace.run` is available):

```sh
plutospace ~/Documents/dev/GroupTherapyOrg/plutospace-demo
```

or, as a package:

```julia
import PlutoSpace
PlutoSpace.run(workspace="/Users/daleblack/Documents/dev/GroupTherapyOrg/plutospace-demo")
```

Lazy/collab mode is the default. Add `--autorun` for classic Pluto reactivity.

## What's in here

```
plutospace-demo/
├── notebooks/
│   ├── 01_welcome.jl          overview + classic reactivity (stdlib, instant)
│   ├── 02_plots.jl            WasmMakie figures + a PlutoUI slider (self-contained env)
│   ├── 03_lazy_and_cache.jl   the two-file lazy model: stale marks, sidecar, restart-survival
│   └── 04_agent_collab.jl     human + agent on one live session (pluto-collab)
├── data/
│   ├── planets.csv            tabular data — opens as a tab
│   └── field-notes.md         a plain Markdown file — opens as a tab
├── scripts/
│   └── sketch.jl              a plain Julia script (no cells) — opens as a tab
├── docs/
│   └── architecture.md        nested doc (shows tree depth)
├── AGENTS.md / CLAUDE.md      the collab stanza agents follow
└── SCREENSHOTS.md             the guided shot list — read this before recording
```

## The one thing to read first

**`SCREENSHOTS.md`** walks every unique feature in capture order, with the exact clicks and
terminal commands for each shot. Start there.

## Packages

Everything except `02_plots.jl` is **pure stdlib** — zero installs, runs instantly, fully
offline. `02_plots.jl` carries its **own embedded environment** (PlutoUI + WasmMakie, with
WasmMakie pinned by git commit via `[sources]`) — Pluto's package manager instantiates it from
your local depot on first open. No `Pkg.activate`, no separate env folder, nothing phones home.

> First open of `02_plots.jl` makes Pluto instantiate that environment and the worker load the
> packages — give it a few seconds the first time. **Don't precompile this env in a terminal
> while the notebook is loading** (two processes compiling the same packages will error each
> other out); just let the notebook do it once.
