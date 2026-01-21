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
	<meta name="description" content="Modern material design for Invidious." />
	<title>Materialious - Watch YouTube privately.</title>
</svelte:head>

<nav class="surface-container top">
	<img class="m l" style="height: 50px;" src="/logo.svg" alt="Materialious icon" />

	<div class="max m l"></div>

	<a class="button" href="#download">
		<i>download</i>
		<span>Download</span>
	</a>
	<a href="https://github.com/Materialious/Materialious" target="_blank" class="button secondary">
		<i>code</i>
		<span>Source code</span>
	</a>
</nav>

<main class="responsive max">
	{@render children()}
</main>
