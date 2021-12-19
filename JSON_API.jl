### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 86ddd2e2-5eda-11ec-22b8-e7be38483773
begin
	using HTTP
	res = HTTP.get("https://xkcd.com/552/info.0.json");
end

# ╔═╡ f0acd270-dbf3-4fde-b52e-d8443a203e02
begin
	using JSON3
	 JSON3.read(res.body)   
		
end

# ╔═╡ 77cc4849-8f6c-400e-bf9d-e754c09eb416
begin
	struct Comic 
    json::JSON3.Object
	end

    Comic() = Comic(JSON3.read(HTTP.get("https://xkcd.com/info.0.json").body))
    
    Comic(i::Int) =         Comic(JSON3.read(HTTP.get("https://xkcd.com/$i/info.0.json").body))
Comic(552)
		
end


# ╔═╡ Cell order:
# ╠═86ddd2e2-5eda-11ec-22b8-e7be38483773
# ╠═f0acd270-dbf3-4fde-b52e-d8443a203e02
# ╠═77cc4849-8f6c-400e-bf9d-e754c09eb416
