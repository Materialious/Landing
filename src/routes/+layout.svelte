<script lang="ts">
	import 'beercss';
	import 'material-dynamic-colors';
	import '$lib/app.css';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href="/logo.svg" />
</svelte:head>

<nav class="surface-container top">
	<img style="height: 50px;" src="/logo.svg" alt="Materialious icon" />

	<div class="max"></div>

	<a href="https://github.com/Materialious/Materialious" target="_blank" class="button">
		<i>code</i>
		<span>Source code</span>
	</a>
</nav>

<main class="responsive max">
	{@render children()}
</main>
