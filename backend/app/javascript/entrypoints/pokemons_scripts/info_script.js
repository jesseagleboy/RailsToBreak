import Info from "../../components/Info.svelte"

console.log( 'This is a test script for pokemon')

const infoPage = new Info( {
    target: document.getElementById( 'info-mount' )
})

export default infoPage