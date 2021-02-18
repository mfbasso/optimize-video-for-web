# Optimize Video for Web

This shell script allows you to optimize videos for web, generating a optimized MP4 and WebM.

## Usage

```shell
    optimize-video.sh [video_file]
```

The optimized videos will be in the `/optimized` directory.

## Applications

### Autoplay vídeos in loop without controls

```html
<video
  class="custom-video"
  autoplay
  loop
  muted
  playsinline
  width="1170"
  height="1009"
>
  <source src="[webm_file]" type="video/webm" />
  <source src="[mp4_file]" type="video/mp4" />
  Your browser does not support the video tag.
</video>
```

### CSS for Responsive vídeos

```css
.custom-video {
  max-width: 100%;
  height: auto;
}
```
