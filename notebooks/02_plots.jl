### A Pluto.jl notebook ###
# v0.1.0

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    return quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ b0000002-0000-4000-8000-000000000002
# This notebook brings its own packages. Instead of Pluto's per-notebook environment, it
# activates the shared `env/` folder of this workspace (PlutoUI + WasmMakie) — so Pluto
# disables its built-in package manager and uses exactly these resolved versions.
begin
	import Pkg
	Pkg.activate(joinpath(@__DIR__, "..", "env"))
	using WasmMakie, PlutoUI
end

# ╔═╡ b0000001-0000-4000-8000-000000000001
md"""
# 📈 Plots that live in the browser

This notebook draws with **[WasmMakie.jl](https://github.com/GroupTherapyOrg/WasmMakie.jl)** —
Makie's plotting API rendered to an HTML `<canvas>`, compiled to WebAssembly. Each figure is
self-contained: no plot server, no image files, it just *is* the output.
"""

# ╔═╡ b0000003-0000-4000-8000-000000000003
md"## A line, a cloud, a field"

# ╔═╡ b0000004-0000-4000-8000-000000000004
let
	x = 0:0.05:4π
	fig = Figure(size = (640, 280))
	ax = Axis(fig[1, 1]; title = "a damped wave", xlabel = "t", ylabel = "f(t)")
	lines!(ax, collect(x), @. exp(-x / 8) * sin(2x))
	fig
end

# ╔═╡ b0000005-0000-4000-8000-000000000005
let
	θ = range(0, 6π; length = 240)
	fig = Figure(size = (640, 320))
	ax = Axis(fig[1, 1]; title = "a spiral of points")
	scatter!(ax, θ .* cos.(θ), θ .* sin.(θ); markersize = 6)
	fig
end

# ╔═╡ b0000006-0000-4000-8000-000000000006
let
	g(i, j) = sin(i / 4) * cos(j / 5) + 0.3 * sin((i + j) / 6)
	fig = Figure(size = (640, 360))
	ax = Axis(fig[1, 1]; title = "a scalar field")
	heatmap!(ax, [g(i, j) for i in 1:60, j in 1:60])
	fig
end

# ╔═╡ b0000007-0000-4000-8000-000000000007
md"""
## Interactive

A **PlutoUI** slider is bound to a variable; the figure below depends on it, so it redraws
as you drag. (Each redraw ships a fresh canvas — keep an eye on it in your recording.)
"""

# ╔═╡ b0000008-0000-4000-8000-000000000008
@bind frequency Slider(1:0.5:6; default = 2.0, show_value = true)

# ╔═╡ b0000009-0000-4000-8000-000000000009
let
	x = 0:0.02:2π
	fig = Figure(size = (640, 260))
	ax = Axis(fig[1, 1]; title = "sin($(frequency)·t)")
	lines!(ax, collect(x), sin.(frequency .* x))
	fig
end

# ╔═╡ Cell order:
# ╟─b0000001-0000-4000-8000-000000000001
# ╠═b0000002-0000-4000-8000-000000000002
# ╟─b0000003-0000-4000-8000-000000000003
# ╠═b0000004-0000-4000-8000-000000000004
# ╠═b0000005-0000-4000-8000-000000000005
# ╠═b0000006-0000-4000-8000-000000000006
# ╟─b0000007-0000-4000-8000-000000000007
# ╠═b0000008-0000-4000-8000-000000000008
# ╠═b0000009-0000-4000-8000-000000000009
