# Crystals World — scroll-film edition (concept build)

The opening film scrubs with the scroll: amethyst, a flare of light, clear quartz, then citrine, and hands off into the shop.
Plain HTML/CSS/JS, no build step. Everything shipped lives in `site/`.

- `site/index.html` — the whole page. Copy, chapters and beat timing are near the top of the `<script>` and in the `.beat` blocks.
- `site/frames/d/` — the film as 451 JPEG frames (15s at 30fps, 1280px). Re-extract with:
  `ffmpeg -i film.mp4 -an -vf "fps=30,scale=1280:-2" -q:v 7 site/frames/d/%04d.jpg` and update `FRAME_COUNT`.
- `site/img/` — the shop's own photos.
- Source film (Dreamina, 1920×1080, 41MB) is kept out of the repo; it lives in `src/` locally.

Run locally: `cd site && python3 -m http.server 8000`.
Verification hooks: `?jump=<scrollY>` lands pre-scrolled; `window.__ready` fires when frames are ready.
Deploy: `./deploy.sh` publishes `site/` to the `gh-pages` branch.
