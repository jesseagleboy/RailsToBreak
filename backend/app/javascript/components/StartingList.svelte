<script>
	import axios from "axios";
	console.log("Home Page is activated");
	const getAllPokemon = async () => {
		const response = await axios.get("https://api.pokemontcg.io/v2/cards?q=supertype:Pokemon&select=id,name,images&orderBy=name");
		console.log(response.data);
        const distinctSet = new Set();
        const uniquePokemon = response.data.data.filter((pokemon) => {
            if (distinctSet.has(pokemon.name)) {
                return false;
            }
            distinctSet.add(pokemon.name);
            return true;
        });
        response.data.data = uniquePokemon;
		return response.data;
	};
	let pokemonList = getAllPokemon();
	console.log(pokemonList, "resulting...");
</script>

{#await pokemonList}
	<p>Loading Pokemon...</p>
{:then pokemonList}
	<ul>
		{#each pokemonList.data as pokemon}
			<a href={`/pokemons/${pokemon.name}`}>
				<li>
					<img src={pokemon.images.small} alt={pokemon.name} loading="lazy" />
					<p>{pokemon.name}</p>
				</li>
			</a>
		{/each}
	</ul>
{:catch error}
	<p>error: {error.message}</p>
{/await}

<style>
	ul {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(12rem, 1fr));
		list-style-type: none;
		gap: 1rem;
        padding: 1rem;
        border: 1px solid #ccc;
	}
	li {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
        text-align: center;
	}
	img {
		width: 100%;
		object-fit: contain;
	}
</style>
