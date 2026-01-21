<script lang="ts">
	import { onDestroy, onMount } from 'svelte';
	import 'swiper/css';
	import 'swiper/css/navigation';
	import Swiper from 'swiper';
	import { Autoplay } from 'swiper/modules';
	import Windows from '$lib/brands/Windows.svelte';
	import Android from '$lib/brands/Android.svelte';
	import Firefox from '$lib/brands/Firefox.svelte';
	import MacOS from '$lib/brands/MacOS.svelte';
	import Docker from '$lib/brands/Docker.svelte';
	import Linux from '$lib/brands/Linux.svelte';

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

	const features: string[] = [
		'No ADs',
		'No Tracking',
		'Invidious companion support.',
		'Local video fallback.',
		'Watch sync parties.',
		'Cross device progress syncing',
		'Sponsorblock built-in.',
		'Return YouTube Dislike built-in.',
		'Custom colour themes.',
		'Player in player support.',
		'PWA support.',
		'YT path redirects.'
	];
</script>

<article class="transparent center-align">
	<h1>Welcome to Materialious</h1>
	<p style="font-size: 1.5em;">Watch YouTube privately.</p>
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

<div class="space"></div>

<article class="max primary center-align padding">
	<h2>Bring anywhere</h2>
	<div class="grid">
		<div class="s12 m4 l2">
			<div>
				<a
					href="https://github.com/Materialious/Materialious/blob/main/docs/DOCKER.md"
					referrerpolicy="no-referrer"
					target="_blank"
				>
					<Firefox />
				</a>
				<span class="tooltip bottom">Use on the web</span>
			</div>
		</div>
		<div class="s12 m4 l2">
			<div>
				<a
					href="https://github.com/Materialious/Materialious/releases/latest/download/Materialious-win32-x64.exe"
					referrerpolicy="no-referrer"
					target="_blank"
				>
					<Windows />
				</a>
				<span class="tooltip bottom">Use on Windows</span>
			</div>
		</div>
		<div class="s12 m4 l2">
			<div>
				<a
					href="https://f-droid.org/packages/us.materialio.app/"
					referrerpolicy="no-referrer"
					target="_blank"
				>
					<Android />
				</a>
				<span class="tooltip bottom">Use on Android</span>
			</div>
		</div>
		<div class="s12 m4 l2">
			<div>
				<a
					href="https://github.com/Materialious/Materialious/blob/main/docs/DOCKER.md"
					referrerpolicy="no-referrer"
					target="_blank"
				>
					<Docker />
				</a>
				<span class="tooltip bottom">Self-host via Docker</span>
			</div>
		</div>
		<div class="s12 m4 l2">
			<div>
				<a
					href="https://github.com/Materialious/Materialious/releases/latest/download/Materialious-darwin-universal.dmg"
					referrerpolicy="no-referrer"
					target="_blank"
				>
					<MacOS />
				</a>
				<span class="tooltip bottom">Use on MacOS</span>
			</div>
		</div>
		<div class="s12 m4 l2">
			<div>
				<a
					href="https://github.com/Materialious/Materialious/releases/latest"
					referrerpolicy="no-referrer"
					target="_blank"
				>
					<Linux />
				</a>
				<span class="tooltip bottom">Use on Linux</span>
			</div>
		</div>
	</div>
</article>

<div class="large-space"></div>

<div class="max">
	<h2 class="center-align">Feature packed</h2>
	<div class="grid">
		{#each features as feature (feature)}
			<div class="s12 m4 l2">
				<article class="secondary center-align" style="height: 100%;">
					<h6>{feature}</h6>
				</article>
			</div>
		{/each}
	</div>
</div>

<div class="large-space"></div>

<article class="max primary" id="download">
	<h2 class="center-align">Download Materialious</h2>
	<div class="grid">
		<div class="s12 m4 l4">
			<nav class="center-align">
				<Windows />
				<div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/Materialious-win32-x64.exe"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>Windows x64</span>
					</a>
					<div></div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/Materialious-win32.exe"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>Windows x32</span>
					</a>
				</div>
			</nav>
		</div>
		<div class="s12 m4 l4">
			<nav class="center-align">
				<Android />
				<div>
					<a
						href="http://apps.obtainium.imranr.dev/redirect.html?r=obtainium://add/https://github.com/Materialious/Materialious"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>Obtainium</span>
					</a>
					<div></div>
					<a
						href="https://f-droid.org/packages/us.materialio.app/"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>F-Droid</span>
					</a>
					<div></div>
					<a
						href="https://apt.izzysoft.de/fdroid/index/apk/us.materialio.app"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>IzzyOnDroid</span>
					</a>
					<div></div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/app-universal-release-signed.apk"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>APK Universal</span>
					</a>
					<div></div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/app-x86_64-release-signed.apk"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>APK x64</span>
					</a>
					<div></div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/app-arm64-v8a-release-signed.apk"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>APK ARM64</span>
					</a>
					<div></div>
				</div>
			</nav>
		</div>
		<div class="s12 m4 l4">
			<nav class="center-align">
				<Linux />
				<div>
					<a
						href="https://flathub.org/apps/us.materialio.Materialious"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>Flathub</span>
					</a>
					<div></div>
					<a
						href="https://snapcraft.io/materialious"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>Snap</span>
					</a>
					<div></div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/Materialious-linux-amd64.deb"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>Debian/Ubuntu</span>
					</a>
					<div></div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/Materialious-linux-x86_64.rpm"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>Fedora/OpenSuse</span>
					</a>
					<div></div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/Materialious-linux-x86_64.AppImage"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>AppImage</span>
					</a>
					<div></div>
					<a
						href="https://github.com/Materialious/Materialious/releases/latest/download/Materialious-linux-x64.7z"
						class="button inverse-primary"
						target="_blank"
						referrerpolicy="no-referrer"
					>
						<i>download</i>
						<span>Tarball</span>
					</a>
					<div></div>
				</div>
			</nav>
		</div>
	</div>
</article>

<style>
	.swiper {
		width: min(70%, 1920px);
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
		object-fit: contain;
	}

	@keyframes scroll-left {
		from {
			transform: translateX(100%);
		}
		to {
			transform: translateX(-100%);
		}
	}

	@media screen and (max-width: 700px) {
		.swiper {
			width: 100%;
		}
	}
</style>
