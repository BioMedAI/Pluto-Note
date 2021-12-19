### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 7fbfbd62-5e18-11ec-36b7-9f00610a9206
begin
  using Ripserer
  using Plots
end


# ╔═╡ cffa6493-e4bd-4769-a0ce-8137fee1fbfe
function noisy_circle(n; r1=1, r2=1, noise=0.1)
    points = NTuple{2,Float64}[]
    for _ in 1:n
        θ = 2π * rand()
        point = (
            r1 * sin(θ) + noise * rand() - noise / 2,
            r2 * cos(θ) + noise * rand() - noise / 2,
        )
        push!(points, point)
    end
    return points
end

# ╔═╡ 153f893a-6c95-4794-b1f6-6014f64f86ea
anim = @animate for _ in 1:200
    points = noisy_circle(100; noise=0)
    result = ripserer(points)

    plt_pts = scatter(
        points;
        legend=false,
        aspect_ratio=1,
        xlim=(-2.2, 2.2),
        ylim=(-2.2, 2.2),
        title="Data",
    )
    plt_diag = plot(result; infinity=3)

    plot(plt_pts, plt_diag; size=(800, 400))
end

# ╔═╡ dcc743e1-5ef7-4df5-a1a6-0ec1bc17a95e


# ╔═╡ Cell order:
# ╠═7fbfbd62-5e18-11ec-36b7-9f00610a9206
# ╠═cffa6493-e4bd-4769-a0ce-8137fee1fbfe
# ╠═153f893a-6c95-4794-b1f6-6014f64f86ea
# ╠═dcc743e1-5ef7-4df5-a1a6-0ec1bc17a95e
