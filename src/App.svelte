<script lang="ts">
  import { onMount, tick } from "svelte";
  import homePreview from "./assets/home-preview.png";
  import iconOnly from "./assets/icon-only.png";

  import SvelteMarkdown from "svelte-markdown";
  import PageLoading from "./PageLoading.svelte";

  const downloadUrl =
    "https://github.com/Materialious/Materialious/releases/download/";
  const latestVersion = "1.0.3";

  const platforms = [
    {
      title: "Android",
      file: "app-release-signed.apk",
      icon: "android",
    },
    {
      title: "Windows",
      file: "Materialious-Setup-1.0.3.exe",
      icon: "window",
    },
    {
      title: "MacOS",
      file: "Materialious-1.0.3-arm64.dmg",
      icon: "nutrition",
    },
    {
      title: "Linux Deb",
      file: "Materialious_1.0.3_amd64.deb",
      icon: "save",
    },
    {
      title: "Linux RPM",
      file: "Materialious-1.0.3.x86_64.rpm",
      icon: "save",
    },
    {
      title: "Linux AppImage",
      file: "Materialious-1.0.3.AppImage",
      icon: "save",
    },
    {
      title: "Linux 7z",
      file: "Materialious-1.0.3.7z",
      icon: "save",
    },
    {
      title: "Linux Zip",
      file: "Materialious-1.0.3.zip",
      icon: "save",
    },
  ];

  let markdownSource = "";

  let shownSection: "docker" | "apps" | "instances" | null = null;

  onMount(() => {
    ui("mode", "dark");
  });

  async function showApps() {
    shownSection = "apps";
    await tick();
    document.getElementById("apps")?.scrollIntoView();
  }

  async function showInstances() {
    markdownSource = "";
    shownSection = "instances";

    await tick();

    document.getElementById("instances")?.scrollIntoView();

    const resp = await fetch(
      "https://raw.githubusercontent.com/Materialious/Materialious/main/docs/INSTANCES.md",
    );
    if (resp.ok) {
      markdownSource = (await resp.text()).replace("# Public instances", "");
    }
  }

  async function showDocker() {
    markdownSource = "";
    shownSection = "docker";

    await tick();

    document.getElementById("docker")?.scrollIntoView();

    const resp = await fetch(
      "https://raw.githubusercontent.com/Materialious/Materialious/main/docs/DOCKER.md",
    );
    if (resp.ok) {
      markdownSource = await resp.text();
    }
  }
</script>

<svelte:head>
  <link rel="icon" href={iconOnly} />
</svelte:head>

<header>
  <nav>
    <img class="large" src={iconOnly} alt="Materialious icon" />
    <h5 class="center-align">Materialious</h5>

    <div class="max"></div>

    <a
      href="https://github.com/Materialious/Materialious"
      target="_blank"
      class="button"
    >
      <i>code</i>
      <span>Source code</span>
    </a>
  </nav>
</header>

<main class="responsive max">
  <article class="transparent header">
    <h2>Modern material design for Invidious</h2>
    <p>
      Materialious is a privacy respecting frontend for YouTube built ontop of
      Invidious.
    </p>
    <img
      id="home-preview"
      src={homePreview}
      alt="Preview of Materialious home page"
    />

    <div class="space"></div>

    <button style="margin-bottom: 1em;" on:click={showApps}>
      <i>download</i>
      <span>Download</span>
    </button>
    <div class="center-align">
      <button
        on:click={showInstances}
        class="button transparent"
        style="margin-bottom: 1em;"
      >
        <i>local_library</i>
        <span>Public instances</span>
      </button>
      <button
        style="margin-bottom: 1em;"
        on:click={showDocker}
        class="transparent"
      >
        <i>dns</i>
        <span>Self-host Materialious</span>
      </button>
    </div>
  </article>

  <div class="divider"></div>
  <div class="space"></div>

  {#if shownSection === "apps"}
    <h3 id="apps">Application installation</h3>
    <div class="space"></div>
    {#each platforms as platform}
      <a
        href={`${downloadUrl}${latestVersion}/${platform.file}`}
        target="_blank"
        class="button"
        style="margin-bottom: 1em;"
      >
        <i>{platform.icon}</i>
        <span>{platform.title}</span>
      </a>
    {/each}
  {:else if shownSection === "instances"}
    <h3 id="instances">Public instances</h3>
    {#if markdownSource === ""}
      <PageLoading />
    {:else}
      <div class="markdown">
        <SvelteMarkdown source={markdownSource} />
      </div>
    {/if}
  {:else if shownSection === "docker"}
    <h3 id="docker">Deploying with Docker</h3>
    {#if markdownSource === ""}
      <PageLoading />
    {:else}
      <div class="markdown">
        <SvelteMarkdown source={markdownSource} />
      </div>
    {/if}
  {/if}
</main>
