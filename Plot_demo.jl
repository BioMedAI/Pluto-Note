### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 004d3056-5ee4-11ec-12ac-750b7ebee606
begin
	using Plots
	x=1:10
	y=rand(10)
	plot(x,y,title="first Plots demo")
end

# ╔═╡ 665707df-cbb3-4570-a4c7-c8bb98c1fdc9
begin
	using Plots;
	plot(rand(100, 4), layout = 4)
end

# ╔═╡ Cell order:
# ╠═004d3056-5ee4-11ec-12ac-750b7ebee606
# ╠═665707df-cbb3-4570-a4c7-c8bb98c1fdc9
