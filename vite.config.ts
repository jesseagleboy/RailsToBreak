import { defineConfig } from "vite";
// import RubyPlugin from "vite-plugin-ruby";
import { svelte } from "@sveltejs/vite-plugin-svelte";
import react from "@vitejs/plugin-react";
import ViteRails from "vite-plugin-rails";
import gzipPlugin from "rollup-plugin-gzip";

export default defineConfig({
	plugins: [ViteRails(), react(), svelte(), gzipPlugin()],
});
