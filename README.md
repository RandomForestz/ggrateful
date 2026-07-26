# ggrateful

Grateful Dead album cover and tour art color palettes for `ggplot2`.

16 discrete palettes pulled from studio album covers, live releases, and iconic
tour art, plus 5 continuous gradient variants for sequential and diverging
color scales.

## Installation

```r
# install.packages("devtools")
devtools::install_github("RandomForestz/ggrateful")
```

## Usage

```r
library(ggplot2)
library(ggrateful)

# discrete fill scale
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  scale_fill_deadhead(name = "dancing_bears") +
  theme_minimal()

# discrete color scale
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point(size = 3) +
  scale_color_deadhead(name = "terrapin_station") +
  theme_minimal()

# continuous gradient fill/color
ggplot(mtcars, aes(x = wt, y = mpg, color = hp)) +
  geom_point(size = 3) +
  scale_color_deadhead_c(name = "best_of") +
  theme_minimal()
```

Preview any palette directly:

```r
display_deadhead("bertha")       # one palette
display_deadhead_all()           # all 16 at once
```

Pull raw hex codes:

```r
deadhead("steal_your_face")      # all colors
deadhead("steal_your_face", 3)   # first 3 colors
```

## Palettes

| Palette | Colors | Continuous variant |
|---|---|---|
| `dancing_bears` | 6 | |
| `blues_for_allah` | 11 | |
| `american_beauty` | 11 | |
| `best_of` | 12 | ✓ |
| `steal_your_face` | 6 | ✓ (diverging) |
| `terrapin_station` | 11 | |
| `wake_of_the_flood` | 11 | ✓ |
| `from_the_mars_hotel` | 11 | |
| `in_the_dark` | 11 | |
| `workingmans_dead` | 11 | ✓ |
| `europe_72` | 11 | |
| `complete_studio_rarities` | 11 | ✓ |
| `cornell_77` | 11 | |
| `go_to_heaven` | 11 | |
| `shakedown_street` | 11 | |
| `bertha` | 11 | |

## Functions

- `deadhead(name, n, reverse)` — pull `n` hex colors from a palette
- `scale_color_deadhead()` / `scale_colour_deadhead()` / `scale_fill_deadhead()` — discrete ggplot scales
- `scale_color_deadhead_c()` / `scale_colour_deadhead_c()` / `scale_fill_deadhead_c()` — continuous ggplot scales
- `display_deadhead(name)` — preview one palette
- `display_deadhead_all()` — preview all palettes at once

## Demo page

See `index.html` for a visual gallery of every palette with album art, swatches,
and example visualizations. Open it locally or serve it via GitHub Pages.

## Disclaimer

Grateful Dead album art, logos, and imagery are the property of their
respective owners. This is an unofficial, fan-made project for extracting
color palettes and is not affiliated with or endorsed by Grateful Dead
Productions.

## License

MIT — see `LICENSE`.
