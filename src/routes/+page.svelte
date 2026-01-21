<script lang="ts">
	import { onDestroy, onMount } from 'svelte';
	import 'swiper/css';
	import 'swiper/css/navigation';
	import Swiper from 'swiper';
	import { Autoplay } from 'swiper/modules';

	let swiper: Swiper | undefined;
	onMount(() => {
		swiper = new Swiper('.swiper', {
			modules: [Autoplay],
			loop: true,
			autoplay: {
				delay: 5000,
				disableOnInteraction: true
			},
			enabled: true
		});
	});

	onDestroy(() => {
		if (swiper) swiper.destroy();
	});
</script>

<article class="transparent header">
	<h1>Welcome to Materialious</h1>
	<p style="font-size: 1.3em;">
		Modern material design frontend for Invidious, focused on a clean, privacy-friendly YouTube
		experience. It supports local video fallback when Invidious fails and is available on Web,
		Desktop, Android, and Android TV.
	</p>
	<div class="space"></div>

	<div class="swiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="/previews/home-preview.png" alt="Preview of Materialious home page" />
			</div>
			<div class="swiper-slide">
				<img src="/previews/player-preview.png" alt="Preview of Materialious player" />
			</div>
			<div class="swiper-slide">
				<img src="/previews/setting-preview.png" alt="Preview of Materialious player" />
			</div>
			<div class="swiper-slide">
				<img src="/previews/chapter-preview.png" alt="Preview of Materialious player" />
			</div>
		</div>
	</div>
</article>

<style>
	.swiper {
		width: min(70%, 1920px);
	}

	.swiper-button-prev,
	.swiper-button-next {
		color: var(--primary);
	}

	.swiper-slide {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.swiper-slide img {
		max-width: 100%;
		max-height: 100%;
		height: auto;
		object-fit: contain; /* key line */
	}

	.header {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	@media screen and (max-width: 700px) {
		.swiper {
			width: 100%;
		}
	}
</style>
