<script>
	import axios from "axios";

	const formBuilder = document.querySelector("[data-test-zone]").dataset.testZone
	console.log(formBuilder, "dataset")

	const getSpecificPokemon = async () => {
		const id = window.location.href.split("/").at(-2);
		const url = `https://api.pokemontcg.io/v2/cards/${id}`;
		console.log(url, "setup url");

		const response = await axios(url);
		console.log(response.data.data, "this response");
		return response.data.data;
	};

	let pokemon = getSpecificPokemon();
</script>

{#await pokemon}
	<p>Loading...</p>
{:then pokemon}
	<div class="card flex-row">
		<p class="underline">ID: {pokemon.id}</p>
		<h4 class="hover:text-sky-400">Name: {pokemon.name}</h4>
		<img class="border-3" src={pokemon.images.small} alt={pokemon.name} />
	</div>
	<input name='card_id' value={pokemon.id} hidden />
	<input name='name' value={pokemon.name} hidden />
	<input name='image_url' value={pokemon.images.small} hidden />
	<input name='full_info' value={JSON.stringify(pokemon)} hidden />

{:catch error}
	<p>{error.message}</p>
{/await}
