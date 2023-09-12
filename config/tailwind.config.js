import { fontFamily as _fontFamily } from 'tailwindcss/defaultTheme'

export const content = [
  './public/*.html',
  './app/helpers/**/*.rb',
  './app/javascript/**/*.{js,jsx,ts,tsx,vue,svelte,scss,css}',
  './app/views/**/*.{erb,haml,html,slim}'
]
export const theme = {
  extend: {
    fontFamily: {
      sans: [ 'Inter var', ..._fontFamily.sans ],
    },
  },
}
export const plugins = [
  require( '@tailwindcss/forms' ),
  require( '@tailwindcss/aspect-ratio' ),
  require( '@tailwindcss/typography' ),
  require( '@tailwindcss/container-queries' ),
]
