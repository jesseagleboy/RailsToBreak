/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ["./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}"],
	theme: {
		extend: {},
	},
	corePlugins: {
		aspectRatio: false,
	},
	plugins: [require("@tailwindcss/typography"), require("@tailwindcss/forms"), require("@tailwindcss/aspect-ratio"), require('@tailwindcss/container-queries'),],
};
