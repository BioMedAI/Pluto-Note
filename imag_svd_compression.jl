### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ e2c752db-738b-429d-bf21-90fecfe0f783
using Images,TestImages

# ╔═╡ 849b2c54-9db4-4b8e-9132-7ebbd7fc4f66
using LinearAlgebra

# ╔═╡ 2fb1ff10-bac7-4f7b-a90d-e6a0cefe2da2
img = float.(testimage("mandrill"))

# ╔═╡ eb6124d9-e0b4-4c74-a7c7-a7f01ab32689
channels = channelview(img)

# ╔═╡ a60655fe-eea5-41ef-bd09-cffc5e1bfb08
begin
	function rank_approx(F::SVD, k)
    U, S, V = F
    M = U[:, 1:k] * Diagonal(S[1:k]) * V[:, 1:k]'
    clamp01!(M)
    end
	svdfactors = svd.(eachslice(channels; dims=1))
	imgs = map((10, 50, 100)) do k
	    colorview(RGB, rank_approx.(svdfactors, k)...)
	end
	
end

# ╔═╡ 1e3d7470-ae34-4912-95b0-e97de061641d
mosaicview(img, imgs...; nrow=1, npad=5)

# ╔═╡ Cell order:
# ╠═e2c752db-738b-429d-bf21-90fecfe0f783
# ╠═849b2c54-9db4-4b8e-9132-7ebbd7fc4f66
# ╠═2fb1ff10-bac7-4f7b-a90d-e6a0cefe2da2
# ╠═eb6124d9-e0b4-4c74-a7c7-a7f01ab32689
# ╠═a60655fe-eea5-41ef-bd09-cffc5e1bfb08
# ╠═1e3d7470-ae34-4912-95b0-e97de061641d
