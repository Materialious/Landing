<script lang="ts">
	import 'beercss';
	import '$lib/app.css';
	import ui from 'beercss';
	import { onMount } from 'svelte';

	let { children } = $props();

	onMount(async () => {
		await ui();
	});
</script>

<svelte:head>
	<link rel="icon" href="/logo.svg" />
	<meta name="keywords" content="invidious,materialious,proxy,youtube,yt,theme,interface,modern" />
	<meta
		name="description"
		content="Modern material design frontend for YouTube & Invidious, focused on a clean, privacy-friendly experience."
	/>
	<title>Materialious - Modern material design frontend for YouTube & Invidious.</title>
</svelte:head>

<nav class="surface-container top">
	<img class="m l" style="height: 50px;" src="/logo.svg" alt="Materialious icon" />

	<div class="max m l"></div>

	<a href="#download" title="Download" aria-label="Download" style="font-size: 1.5rem">
		<i>download</i>
	</a>
	<a
		href="https://github.com/Materialious/Materialious"
		target="_blank"
		title="Source code"
		aria-label="Source code"
		style="font-size: 1.5rem"
	>
		<i>code</i>
	</a>
</nav>

<main class="responsive">
	{@render children()}
</main>
