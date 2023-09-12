import {createRoot} from "react-dom/client" 
import ReactHome from "../../components/Home.jsx"

const root = document.getElementById( "react-mount" )

createRoot( root ).render( <ReactHome /> )