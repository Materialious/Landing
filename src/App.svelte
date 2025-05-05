<script lang="ts">
    import { getClass } from "file-icons-js";
    import "file-icons-js/css/style.css";
    import { onMount, tick } from "svelte";
    import Markdown from "svelte-exmarkdown";
    import { UAParser } from "ua-parser-js";
    import homePreview from "./assets/home-preview.png";
    import iconOnly from "./assets/logo.svg";
    import PageLoading from "./PageLoading.svelte";

    let markdownSource = $state("");

    let shownSection: "docker" | "apps" | "instances" | null = $state(null);

    let release: Record<string, any> = $state({});
    let assetsPlatforms: Record<string, any> = $state({});
    let activePlatform: string = $state("");

    onMount(() => {
        ui("mode", "dark");
        activePlatform =
            new UAParser(navigator.userAgent).getOS().name?.toLowerCase() || "";
    });

    function blockFromDownload(fileName: string): boolean {
        return fileName.endsWith(".blockmap") || fileName.endsWith(".yml");
    }

    function prettyPlatform(platform: string): string {
        platform = platform.toLowerCase();
        if (platform === "darwin") {
            return "Macintosh";
        } else if (platform === "windows") {
            return "Windows";
        }
        return platform;
    }

    type BuildInfo = {
        platform: string;
        arch?: string;
        ext: string;
    };

    function extractPlatformAndArch(fileName: string): BuildInfo | null {
        const regex = /([\d.]+)-([^-]+)(?:-([^-]+))?\.(\w+)$/;
        const match = fileName.match(regex);

        if (match) {
            return {
                platform: ["apk", "aab"].includes(match[4])
                    ? "android"
                    : prettyPlatform(match[2]),
                arch: ["apk", "aab"].includes(match[4])
                    ? `x${match[1]}`
                    : match[3] || undefined,
                ext: match[4],
            };
        } else {
            return null;
        }
    }

    async function showApps() {
        const resp = await fetch(
            "https://api.github.com/repos/Materialious/Materialious/releases/latest",
        );
        if (resp.ok) {
            release = await resp.json();

            release.assets.forEach((asset: Record<string, any>) => {
                if (!blockFromDownload(asset.name)) {
                    const extracted = extractPlatformAndArch(asset.name);

                    if (extracted?.platform) {
                        if (!(extracted.platform in assetsPlatforms)) {
                            assetsPlatforms[extracted.platform] = [];
                        }

                        assetsPlatforms[extracted.platform].push({
                            asset: asset,
                            extracted: extracted,
                        });
                    }
                }
            });
        }
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
            markdownSource = (await resp.text()).replace(
                "# Public instances",
                "",
            );
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
        <img style="height: 50px;" src={iconOnly} alt="Materialious icon" />
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
            Materialious is a privacy respecting frontend for YouTube built
            ontop of Invidious.
        </p>
        <img
            id="home-preview"
            src={homePreview}
            alt="Preview of Materialious home page"
        />

        <div class="space"></div>

        {#if !release.draft}
            <button
                class="extra"
                style="margin-bottom: 1em;"
                onclick={showApps}
            >
                <i>download</i>
                <span>Download</span>
            </button>
        {/if}
        <div class="center-align">
            <button
                onclick={showInstances}
                class="button transparent"
                style="margin-bottom: 1em;"
            >
                <i>local_library</i>
                <span>Public instances</span>
            </button>
            <button
                style="margin-bottom: 1em;"
                onclick={showDocker}
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
        <h3 id="apps">Release {release.name}</h3>
        <div class="space"></div>
        <div>
            <nav class="tabbed">
                {#each Object.keys(assetsPlatforms) as platform}
                    <a
                        onclick={() => (activePlatform = platform)}
                        class:active={activePlatform === platform}
                    >
                        <span style="text-transform: capitalize;"
                            >{platform}</span
                        >
                    </a>
                {/each}
            </nav>
            {#each Object.keys(assetsPlatforms) as platform}
                <div
                    class="page padding"
                    class:active={activePlatform === platform}
                >
                    <ul>
                        {#each assetsPlatforms[platform] as asset}
                            <li>
                                <a
                                    href={asset.asset.browser_download_url}
                                    target="_blank"
                                    class="button"
                                    rel="noopener noreferrer"
                                >
                                    <div
                                        class={getClass(asset.asset.name)}
                                    ></div>
                                    <span>
                                        {asset.extracted.ext}
                                        {asset.extracted?.arch}
                                    </span>
                                </a>
                            </li>
                        {/each}
                    </ul>
                </div>
            {/each}
        </div>
    {:else if shownSection === "instances"}
        <h3 id="instances">Public instances</h3>
        {#if markdownSource === ""}
            <PageLoading />
        {:else}
            <div class="markdown">
                <Markdown md={markdownSource} />
            </div>
        {/if}
    {:else if shownSection === "docker"}
        <h3 id="docker">Deploying with Docker</h3>
        {#if markdownSource === ""}
            <PageLoading />
        {:else}
            <div class="markdown">
                <Markdown md={markdownSource} />
            </div>
        {/if}
    {/if}
</main>
