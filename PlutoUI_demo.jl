### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ f5f69190-5f08-11ec-1a42-0952046242a1
begin
    import Pkg
    Pkg.activate(mktempdir())
    Pkg.add([
        Pkg.PackageSpec(name="PlutoUI", version="0.7"),
        Pkg.PackageSpec(name="HypertextLiteral", version="0.6"),
        Pkg.PackageSpec(name="JSON", version="0.21"),
    ])
    using PlutoUI, HypertextLiteral, JSON
end

# ╔═╡ b2bbc3d2-0f4c-4bee-a82e-495c678d2d37
ClickCounter(text="Click") = @htl("""
<div>
<button id="add_button">$(text)</button>
<button id="reset_button">reset</button>

<script>

	// Select elements relative to `currentScript`
	var div = currentScript.parentElement
	var add_button = div.querySelector("#add_button")
	var reset_button = div.querySelector("#reset_button")

	// we wrapped the button in a `div` to hide its default behaviour from Pluto

	var count = 0

	add_button.addEventListener("click", (e) => {
		count += 1

		// we dispatch the input event on the div, not the button, because 
		// Pluto's `@bind` mechanism listens for events on the **first element** in the
		// HTML output. In our case, that's the div.

		div.value = count
		div.dispatchEvent(new CustomEvent("input"))
		e.preventDefault()
	})
	
	reset_button.addEventListener("click", (e) => {
		
        count=0
		div.value = 0
		div.dispatchEvent(new CustomEvent("input"))
		e.preventDefault()
	})

	// Set the initial value
	div.value = count

</script>
</div>
""")

# ╔═╡ 2165c042-d7e9-4282-a536-168736e42b5a
@bind num_clicks ClickCounter()

# ╔═╡ 3c6d479f-59f0-4933-a07d-0a866c214fc3
num_clicks

# ╔═╡ 9adf09be-ba1c-4688-9c2f-66f917ecd9b5
x = ["hello pluton!", 232000,2,2,12 ,12,2,21,1,2, 120000]

# ╔═╡ e4379e02-9738-4852-86e3-2467fbe6dce4
state = Dict(
	:x => x
	)

# ╔═╡ 2aca634c-298b-416d-9ab9-835f1a5e022a
@htl("""
<link href="https://cdn.bootcdn.net/ajax/libs/tailwindcss/2.2.7/utilities.min.css" rel="stylesheet">
<script type="module" id="asdf">
	//await new Promise(r => setTimeout(r, 1000))
	
	const { html, render, Component, useEffect, useLayoutEffect, useState, useRef, useMemo, createContext, useContext, } = await import( "https://cdn.jsdelivr.net/npm/htm@3.0.4/preact/standalone.mjs")

	const node = this ?? document.createElement("div")
	
	const new_state = $(json(state))
	
	if(this == null){
	
		// PREACT APP STARTS HERE
		
		const Item = ({value}) => {
			const [loading, set_loading] = useState(true)

			useEffect(() => {
				set_loading(true)

				const handle = setTimeout(() => {
					set_loading(false)
				}, 1000)

				return () => clearTimeout(handle)
			}, [value])

			return html`<li class="text-green-300">\${loading ? 
				html`<em>Loading...</em>` : 
				value
			}</li>`
		}

        const App = () => {

            const [state, set_state] = useState(new_state)
            node.set_app_state = set_state

            return html`<h5 class="text-lg text-red-50">Hello world!</h5>
                <ul>\${
                state.x.map((x,i) => html`<\${Item} value=\${x} key=\${i}/>`)
            }</ul>`;
        }

		// PREACT APP ENDS HERE

        render(html`<\${App}/>`, node);
	
	} else {
		
		node.set_app_state(new_state)
	}
	return node
</script>
	
	
""")

# ╔═╡ Cell order:
# ╠═f5f69190-5f08-11ec-1a42-0952046242a1
# ╠═b2bbc3d2-0f4c-4bee-a82e-495c678d2d37
# ╠═2165c042-d7e9-4282-a536-168736e42b5a
# ╠═3c6d479f-59f0-4933-a07d-0a866c214fc3
# ╠═2aca634c-298b-416d-9ab9-835f1a5e022a
# ╠═9adf09be-ba1c-4688-9c2f-66f917ecd9b5
# ╠═e4379e02-9738-4852-86e3-2467fbe6dce4
