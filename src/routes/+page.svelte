<article class="transparent header">
	<h1>Welcome to Materialious</h1>
	<p style="font-size: 1.3em;">
		Modern material design frontend for Invidious, focused on a clean, privacy-friendly YouTube
		experience. It supports local video fallback when Invidious fails and is available on Web,
		Desktop, Android, and Android TV.
	</p>
	<div class="space"></div>
	<img id="home-preview" src="/previews/home-preview.png" alt="Preview of Materialious home page" />
</article>

<style>
	#home-preview {
		width: min(70%, 1920px);
	}

	.header {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	@media screen and (max-width: 700px) {
		#home-preview {
			width: 100%;
		}
	}
</style>
