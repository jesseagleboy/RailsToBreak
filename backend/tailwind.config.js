/** @type {import('tailwindcss').Config} */
import { fontFamily as _fontFamily } from "tailwindcss/defaultTheme";
export default {
	content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}", "./app/assets/**/*.{vue,svelte,scss,css,jsx}", "./public/*.html", "./app/helpers/**/*.rb", "./app/javascript/**/*.{js,jsx,ts,tsx,vue,svelte,scss,css}", "./app/views/**/*.{erb,haml,html,slim}"],
	theme: {
		extend: {
			fontFamily: {
				sans: ["Inter var", ..._fontFamily.sans],
			},
		},
	},
	plugins: [require("@tailwindcss/forms"), require("@tailwindcss/aspect-ratio"), require("@tailwindcss/typography"), require("@tailwindcss/container-queries")],
};
