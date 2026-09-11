<script lang="ts">
	import { onDestroy, onMount } from 'svelte';
	import 'swiper/css';
	import 'swiper/css/navigation';
	import 'swiper/css/pagination';
	import Swiper from 'swiper';
	import { Autoplay, Navigation, Pagination } from 'swiper/modules';
	import Windows from '$lib/brands/Windows.svelte';
	import Android from '$lib/brands/Android.svelte';
	import Firefox from '$lib/brands/Firefox.svelte';
	import MacOS from '$lib/brands/MacOS.svelte';
	import Docker from '$lib/brands/Docker.svelte';
	import Linux from '$lib/brands/Linux.svelte';

	const PREVIEWS_BASE = 'https://raw.githubusercontent.com/Materialious/Materialious/main/previews';

	const slides: { src: string; alt: string }[] = [
		{ src: `${PREVIEWS_BASE}/home-preview.png`, alt: 'Preview of the Materialious home page' },
		{ src: `${PREVIEWS_BASE}/player-preview.png`, alt: 'Preview of the Materialious player' },
		{ src: `${PREVIEWS_BASE}/channel-preview.png`, alt: 'Preview of a Materialious channel page' },
		{ src: `${PREVIEWS_BASE}/playlist-preview.png`, alt: 'Preview of a Materialious playlist' },
		{ src: `${PREVIEWS_BASE}/setting-preview.png`, alt: 'Preview of the Materialious settings' },
		{ src: `${PREVIEWS_BASE}/login-previews.png`, alt: 'Preview of the Materialious login' },
		{ src: `${PREVIEWS_BASE}/android-tv-home.png`, alt: 'Preview of Materialious on Android TV' },
		{ src: `${PREVIEWS_BASE}/chapter-previews.png`, alt: 'Preview of Materialious chapters' }
	];

	let swiper: Swiper | undefined;
	onMount(() => {
		swiper = new Swiper('.swiper', {
			modules: [Autoplay, Navigation, Pagination],
			loop: true,
			autoplay: {
				delay: 5000,
				disableOnInteraction: true
			},
			navigation: {
				nextEl: '.swiper-next',
				prevEl: '.swiper-prev'
			},
			pagination: {
				el: '.swiper-pagination',
				clickable: true
			}
		});
	});

	onDestroy(() => {
		if (swiper) swiper.destroy();
	});

	const features: string[] = [
		'No ads',
		'No tracking',
		'Encrypted subscriptions',
		'History & progress sync',
		'Proof-of-work captcha',
		'Subscription import/export',
		'Invidious is optional',
		'Local video fallback',
		'Invidious companion support',
		'Android TV support',
		'Homelab friendly',
		'Cross-session progress sync',
		'Sponsorblock',
		'Return YouTube Dislike',
		'DeArrow',
		'Light & Dark themes',
		'Custom colour themes',
		'Invidious subscriptions',
		'Live stream support',
		'DASH support',
		'Chapters',
		'Mini player',
		'Playlists',
		'PWA support',
		'YT path redirects'
	];

	type Platform = {
		icon: 'windows' | 'android' | 'linux';
		name: string;
		links: { label: string; href: string }[];
	};

	const platforms: Platform[] = [
		{
			icon: 'windows',
			name: 'Windows',
			links: [
				{
					label: 'Windows x64',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/Materialious-win32-x64.exe'
				},
				{
					label: 'Windows x32',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/Materialious-win32.exe'
				}
			]
		},
		{
			icon: 'android',
			name: 'Android',
			links: [
				{
					label: 'F-Droid',
					href: 'https://f-droid.org/packages/us.materialio.app/'
				},
				{
					label: 'IzzyOnDroid',
					href: 'https://apt.izzysoft.de/fdroid/index/apk/us.materialio.app'
				},
				{
					label: 'APK Universal',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/app-universal-release-signed.apk'
				},
				{
					label: 'APK x64',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/app-x86_64-release-signed.apk'
				},
				{
					label: 'APK ARM64',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/app-arm64-v8a-release-signed.apk'
				},
				{
					label: 'Obtainium',
					href: 'http://apps.obtainium.imranr.dev/redirect.html?r=obtainium://add/https://github.com/Materialious/Materialious'
				}
			]
		},
		{
			icon: 'linux',
			name: 'Linux',
			links: [
				{
					label: 'Flathub',
					href: 'https://flathub.org/apps/us.materialio.Materialious'
				},
				{
					label: 'Snap',
					href: 'https://snapcraft.io/materialious'
				},
				{
					label: 'Debian/Ubuntu',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/Materialious-linux-amd64.deb'
				},
				{
					label: 'Fedora/OpenSuse',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/Materialious-linux-x86_64.rpm'
				},
				{
					label: 'AppImage',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/Materialious-linux-x86_64.AppImage'
				},
				{
					label: 'Tarball',
					href: 'https://github.com/Materialious/Materialious/releases/latest/download/Materialious-linux-x64.7z'
				}
			]
		}
	];

	const brandLinks: {
		icon: 'firefox' | 'windows' | 'android' | 'docker' | 'macos' | 'linux';
		name: string;
		caption: string;
		href: string;
	}[] = [
		{
			icon: 'firefox',
			name: 'Web',
			caption: 'Run it right in your browser',
			href: 'https://github.com/Materialious/Materialious/blob/main/docs/DOCKER-FULL.md'
		},
		{
			icon: 'windows',
			name: 'Windows',
			caption: 'Desktop app for x64 & x32',
			href: 'https://github.com/Materialious/Materialious/releases/latest/download/Materialious-win32-x64.exe'
		},
		{
			icon: 'android',
			name: 'Android',
			caption: 'Phones, tablets & Android TV',
			href: 'https://f-droid.org/packages/us.materialio.app/'
		},
		{
			icon: 'docker',
			name: 'Docker',
			caption: 'Self-host your own instance',
			href: 'https://github.com/Materialious/Materialious/blob/main/docs/DOCKER-FULL.md'
		},
		{
			icon: 'macos',
			name: 'macOS',
			caption: 'Native app for Apple Silicon',
			href: 'https://github.com/Materialious/Materialious/releases/latest/download/Materialious-darwin-universal.dmg'
		},
		{
			icon: 'linux',
			name: 'Linux',
			caption: 'deb, rpm & AppImage builds',
			href: 'https://github.com/Materialious/Materialious/releases/latest'
		}
	];
</script>

<section class="center-align hero">
	<h1>Welcome to Materialious</h1>
	<p class="hero-tagline">
		Materialious is a modern material design frontend for YouTube & Invidious, focused on a clean,
		privacy-friendly YouTube experience. It supports local video fallback when Invidious fails and
		is available on Web, Desktop, Android, and Android TV.
	</p>
	<nav class="center-align">
		<a class="button" href="#download">
			<i>download</i>
			<span>Download</span>
		</a>
		<a
			class="button secondary"
			href="https://github.com/Materialious/Materialious"
			target="_blank"
			referrerpolicy="no-referrer"
		>
			<i>code</i>
			<span>Source code</span>
		</a>
	</nav>
	<div class="medium-space"></div>
	<div class="swiper">
		<div class="swiper-wrapper">
			{#each slides as slide (slide.src)}
				<div class="swiper-slide">
					<img src={slide.src} alt={slide.alt} loading="lazy" decoding="async" />
				</div>
			{/each}
		</div>
		<div class="swiper-pagination"></div>
	</div>
</section>

<div class="extra-space"></div>

<section class="primary callout center-align padding">
	<h2>Bring anywhere</h2>
	<p class="large-text">One instance. Every device you own.</p>
	<div class="grid medium-space">
		{#each brandLinks as brand (brand.icon)}
			<div class="s6 m4 l4">
				<a class="brand-card" href={brand.href} target="_blank" referrerpolicy="no-referrer">
					{#if brand.icon === 'firefox'}
						<Firefox />
					{:else if brand.icon === 'windows'}
						<Windows />
					{:else if brand.icon === 'android'}
						<Android />
					{:else if brand.icon === 'docker'}
						<Docker />
					{:else if brand.icon === 'macos'}
						<MacOS />
					{:else}
						<Linux />
					{/if}
					<div>
						<span class="bold block">{brand.name}</span>
						<span class="small-text small-opacity">{brand.caption}</span>
					</div>
				</a>
			</div>
		{/each}
	</div>
</section>

<div class="extra-space"></div>

<div class="center-align">
	<h2>Feature packed</h2>
	<p class="large-text">Everything you love about YouTube, minus the noise.</p>
	<div class="grid medium-space">
		{#each features as feature (feature)}
			<div class="s12 m6 l3">
				<article class="feature-card secondary-container center-align">
					<h6 class="no-margin">{feature}</h6>
				</article>
			</div>
		{/each}
	</div>
</div>

<div class="extra-space"></div>

<section class="primary callout padding" id="download">
	<h2 class="center-align">Download Materialious</h2>
	<div class="grid medium-space">
		{#each platforms as platform (platform.icon)}
			<div class="s12 m6 l4">
				<article class="surface download-card">
					{#if platform.icon === 'windows'}
						<Windows />
					{:else if platform.icon === 'android'}
						<Android />
					{:else}
						<Linux />
					{/if}
					<h5>{platform.name}</h5>
					<nav class="vertical center-align">
						{#each platform.links as link (link.href)}
							<a class="button" href={link.href} target="_blank" referrerpolicy="no-referrer">
								<i>download</i>
								<span>{link.label}</span>
							</a>
						{/each}
					</nav>
				</article>
			</div>
		{/each}
	</div>
</section>

<footer class="center-align padding">
	<p class="small-text small-opacity no-margin">
		Materialious - A modern material design frontend for YouTube & Invidious.
	</p>
</footer>

<style>
	:global(.swiper) {
		width: min(70%, 1920px);
	}

	.hero-tagline {
		max-width: 48rem;
		margin-inline: auto;
		font-size: 1.1rem;
		line-height: 1.6;
		color: var(--on-surface-variant);
	}

	:global(.swiper-slide) {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	:global(.swiper-slide img) {
		width: 100%;
		height: auto;
		max-height: 600px;
		object-fit: contain;
		border-radius: 1rem;
		box-shadow: var(--elevate1);
	}

	:global(.swiper-button-next),
	:global(.swiper-button-prev) {
		display: none;
	}

	:global(.swiper-prev),
	:global(.swiper-next) {
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		z-index: 10;
		cursor: pointer;
		display: flex;
		align-items: center;
		justify-content: center;
		width: 48px;
		height: 48px;
		border-radius: 50%;
		background: var(--surface-container-high);
		color: var(--on-surface);
		box-shadow: var(--elevate2);
		transition:
			transform var(--speed2),
			box-shadow var(--speed2);
	}

	:global(.swiper-prev) {
		left: 16px;
	}

	:global(.swiper-next) {
		right: 16px;
	}

	:global(.swiper-prev:hover),
	:global(.swiper-next:hover) {
		transform: translateY(-50%) scale(1.1);
		box-shadow: var(--elevate3);
	}

	:global(.swiper-pagination) {
		position: relative;
		margin-top: 1.5rem;
		display: flex;
		justify-content: center;
		gap: 0.5rem;
	}

	:global(.swiper-pagination-bullet) {
		width: 8px;
		height: 8px;
		border-radius: 4px;
		background: var(--primary);
		opacity: 0.35;
		transition:
			opacity var(--speed2),
			width var(--speed2);
	}

	:global(.swiper-pagination-bullet-active) {
		opacity: 1;
		width: 24px;
	}

	.brand-card {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		gap: 1rem;
		height: 100%;
		padding: 1.25rem 1rem;
		text-align: center;
		color: var(--on-surface);
		background: var(--surface);
		border-radius: 1rem;
		box-shadow: var(--elevate1);
		transition:
			transform var(--speed2),
			box-shadow var(--speed2);
	}

	.brand-card:hover {
		transform: translateY(-0.25rem);
		box-shadow: var(--elevate3);
	}

	.brand-card :global(svg) {
		width: 56px;
		height: 56px;
		color: var(--primary);
	}

	.callout {
		border-radius: 1rem;
	}

	.feature-card {
		height: 5.5rem;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		gap: 0.5rem;
	}

	.feature-card h6 {
		font-size: 0.9375rem;
	}

	.download-card {
		height: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: flex-start;
		gap: 0.75rem;
		padding: 1.5rem;
	}

	.download-card :global(svg) {
		width: 52px;
		height: 52px;
		color: var(--primary);
	}

	.download-card h5 {
		text-align: center;
	}

	.download-card nav {
		width: 100%;
		flex-direction: column;
		align-items: stretch;
		margin-top: 0.5rem;
		gap: 0.875rem;
		padding-block: 0.75rem;
	}

	.download-card .button {
		width: min(100%, 17rem);
		margin-inline: auto;
	}

	@media screen and (max-width: 700px) {
		.callout,
		.feature-card,
		.download-card {
			border-radius: 0;
		}

		:global(.swiper) {
			width: 100%;
		}

		:global(.swiper-slide img) {
			max-height: 320px;
			border-radius: 0.5rem;
		}

		:global(.swiper-prev),
		:global(.swiper-next) {
			width: 36px;
			height: 36px;
		}

		:global(.swiper-prev) {
			left: 8px;
		}

		:global(.swiper-next) {
			right: 8px;
		}
	}
</style>
