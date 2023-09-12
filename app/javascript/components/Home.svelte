<script>
	import axios from "axios";
	const controller = new AbortController();
	const fetchPokemon = async () => {
		const getPokemonName = window.location.href.split("/").at(-1);
		console.log(getPokemonName, "getPokemonName");
		const specificPokemonURL = `https://api.pokemontcg.io/v2/cards?q=(name:"*${getPokemonName}*" supertype:Pokemon)&pageSize=100`;
		const response = await axios.get(specificPokemonURL, { signal: controller.signal });
		console.log(response.data, "current cards");
		return response.data;
	};
	let currentPokemon = fetchPokemon();

	let hoveredPokemon = "";
	const getHoveredName = card => {
		console.log(card, "card working");
		hoveredPokemon = card.name;
		console.log(hoveredPokemon);
	};
	const createSafeURL = (card) => {
		const safeCardName = encodeURI(card.name).replace('.', '+')
		return `./${safeCardName}/${card.id}/info`
	};
</script>

<div class="wrapper">
	{#await currentPokemon}
		<p>Loading Pokemon...</p>
	{:then pokemonCards}
		<div class="image-list">
			{#each pokemonCards.data as card, i}
				<div class="single-card hover:ring-4" role="card" on:mouseover={() => getHoveredName(card)}>
					<a href={createSafeURL(card)} class="">
						<img src={card.images.small} alt={card.name} loading="lazy" height="100" />
					</a>
				</div>
			{/each}
		</div>
		<div>Pokemon Name:{hoveredPokemon}</div>
	{:catch error}
		<p>Error:</p>
		<code>{error.message}</code>
	{/await}
</div>

<style>
	.image-list {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
		grid-gap: 1rem;
		justify-items: center;
	}
	img {
		margin: 0;
	}

	body {
		position: relative;
	}
</style>
