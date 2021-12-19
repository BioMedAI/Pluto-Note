### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ ecf99396-5e16-11ec-1735-c5307d7bf94a
data = [(rand(), rand(), rand()) for _ in 1:200]

# ╔═╡ 026cc2c9-059b-4d59-a95d-e0d884629b84
begin
	using Ripserer
	ripserer(data)
end

# ╔═╡ fca029d7-51f9-4ae2-96eb-d0aa5f086304
begin
	using Plots
	result=ripserer(data,dim_max=2)
	plot(plot(result),barcode(result))
end

# ╔═╡ Cell order:
# ╠═ecf99396-5e16-11ec-1735-c5307d7bf94a
# ╠═026cc2c9-059b-4d59-a95d-e0d884629b84
# ╠═fca029d7-51f9-4ae2-96eb-d0aa5f086304
