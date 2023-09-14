import Home from "../../components/Home.svelte"

console.log( 'This is a test script for pokemon' )

const homePage = new Home( {
    target: document.getElementById( 'show-mount' )
} )

export default homePage