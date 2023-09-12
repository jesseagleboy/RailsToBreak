import { count } from "../entrypoints/signals.js"

function Home () {
    
    return (
        <div>
            <h1>React Current count: { count }</h1>
            <button onClick={() => count.value++}>Click Here</button>
        </div>
    )
}

export default Home