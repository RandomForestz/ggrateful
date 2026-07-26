#' Grateful Dead Color Palettes
#'
#' A collection of color palettes derived from Grateful Dead album covers
#' and logos, for use with ggplot2.
#'
#' @export
ggrateful_palettes <- list(

  dancing_bears = c("#63429b", "#42ae49", "#fbde06", "#f89422", "#e9138f", "#1561ac"),

  blues_for_allah = c("#79b114", "#d56321", "#98f102", "#ad8c51", "#ae1713",
                       "#354125", "#486e20", "#552545", "#d48c1f", "#7a5736", "#52281f"),

  american_beauty = c("#b00e19", "#a4380e", "#40a41c", "#85c8da", "#e90512",
                       "#a9a04e", "#cb4171", "#c26a17", "#701d0c", "#525e41", "#6f6b21"),

  best_of = c("#f42824", "#d93534", "#ff1a0b", "#fbdb76", "#741e17", "#f18f3b",
              "#846b56", "#d8ac7e", "#b43735", "#411d14", "#f4f0d8", "#000000"),

  steal_your_face = c("#231f20", "#25317b", "#ee1b2c", "#ffffff", "#24307f", "#e91e2a"),

  terrapin_station = c("#99c960", "#578a58", "#4794fb", "#a33842", "#c3e5f7",
                        "#c5e544", "#b2a77c", "#caa259", "#4d2c2d", "#88dc50", "#91c4fa"),

  wake_of_the_flood = c("#e4ad54", "#cf8e43", "#4b322c", "#f3b23b", "#994e2c",
                         "#b67544", "#607650", "#723438", "#dde4b4", "#7e513e", "#e9bc7a"),

  from_the_mars_hotel = c("#e3b538", "#d6b25d", "#6686aa", "#b54445", "#1c1916",
                           "#cdc69d", "#60431f", "#8a875e", "#505a68", "#b27234", "#e8a510"),

  in_the_dark = c("#904723", "#b86838", "#405389", "#963b04", "#b3a3a4",
                   "#894b50", "#cf995e", "#71647b", "#3a395a", "#4d261d", "#9f3f3e"),

  workingmans_dead = c("#e7c935", "#0f1911", "#9e9f69", "#5a5526", "#ead984",
                        "#2f4332", "#282206", "#66775b", "#f6d844", "#d2c67e", "#d9bb28"),

  europe_72 = c("#e0d03f", "#bcbe54", "#b56f8f", "#fbfbf1", "#ca7930", "#80a9b3",
                "#8b6948", "#89ad78", "#d2a338", "#cd5636", "#c4b376"),

  complete_studio_rarities = c("#a73c1c", "#fbeadd", "#96563f", "#c39669", "#6c2e12",
                                "#faf0b9", "#cd8c77", "#f6bda5", "#821f02", "#78240d", "#a34425"),

  cornell_77 = c("#f07537", "#f18e26", "#14a0aa", "#923c7d", "#c15d57", "#67678f",
                 "#45829d", "#f16646", "#d33677", "#9d985e", "#ff820c"),

  go_to_heaven = c("#be9357", "#dcb867", "#6494bd", "#563b2d", "#d6a133", "#808595",
                    "#cdbb98", "#404252", "#90714e", "#f6cb5a", "#7b675e"),

  shakedown_street = c("#97b738", "#f5cd5a", "#2777d1", "#fadb33", "#ece4cb",
                        "#97cbd3", "#765036", "#7e8d56", "#384591", "#df951d", "#bdcc19"),

  bertha = c("#da130a", "#105bbb", "#f8e5bc", "#3c5036", "#f5a811", "#4c1811",
             "#19101c", "#061d8a", "#6992b8", "#a92a20", "#ff0401")
)

#' Grateful Dead Gradient Palettes
#'
#' A subset of \code{ggrateful_palettes}, reordered so the colors ramp
#' smoothly for use as continuous (sequential or diverging) scales.
#'
#' @export
ggrateful_gradients <- list(
  # sequential: dark -> light
  workingmans_dead = c("#0f1911", "#282206", "#2f4332", "#5a5526", "#66775b",
                        "#9e9f69", "#d9bb28", "#e7c935", "#d2c67e", "#f6d844", "#ead984"),

  best_of = c("#000000", "#411d14", "#741e17", "#b43735", "#ff1a0b", "#f42824",
              "#d93534", "#846b56", "#f18f3b", "#d8ac7e", "#fbdb76", "#f4f0d8"),

  wake_of_the_flood = c("#4b322c", "#723438", "#7e513e", "#994e2c", "#607650",
                         "#b67544", "#cf8e43", "#e4ad54", "#f3b23b", "#e9bc7a", "#dde4b4"),

  complete_studio_rarities = c("#821f02", "#78240d", "#6c2e12", "#a73c1c", "#a34425",
                                "#96563f", "#cd8c77", "#c39669", "#f6bda5", "#faf0b9", "#fbeadd"),

  # diverging: blue -> white -> red
  steal_your_face = c("#25317b", "#24307f", "#231f20", "#ffffff", "#ee1b2c", "#e91e2a")
)

#' Get a Grateful Dead palette
#'
#' @param name Name of the palette (see \code{names(ggrateful_palettes)})
#' @param n Number of colors to return (defaults to all colors in the palette)
#' @param reverse Logical; reverse the color order
#' @return A character vector of hex color codes
#' @export
deadhead <- function(name, n, reverse = FALSE) {
  pal <- ggrateful_palettes[[name]]
  if (is.null(pal)) {
    stop(sprintf(
      "Palette '%s' not found. Available palettes: %s",
      name, paste(names(ggrateful_palettes), collapse = ", ")
    ))
  }
  if (reverse) pal <- rev(pal)
  if (missing(n)) n <- length(pal)
  if (n > length(pal)) {
    stop(sprintf("Palette '%s' only has %d colors, requested %d.", name, length(pal), n))
  }
  pal[seq_len(n)]
}

#' Discrete color scale using a Grateful Dead palette
#'
#' @param name Name of the palette
#' @param reverse Logical; reverse the color order
#' @param ... Additional arguments passed to \code{ggplot2::discrete_scale}
#' @export
scale_color_deadhead <- function(name = "dancing_bears", reverse = FALSE, ...) {
  pal <- ggrateful_palettes[[name]]
  if (is.null(pal)) {
    stop(sprintf(
      "Palette '%s' not found. Available palettes: %s",
      name, paste(names(ggrateful_palettes), collapse = ", ")
    ))
  }
  if (reverse) pal <- rev(pal)
  ggplot2::discrete_scale("colour", "deadhead", palette = scales::manual_pal(pal), ...)
}

#' @rdname scale_color_deadhead
#' @export
scale_colour_deadhead <- scale_color_deadhead

#' Discrete fill scale using a Grateful Dead palette
#'
#' @param name Name of the palette
#' @param reverse Logical; reverse the color order
#' @param ... Additional arguments passed to \code{ggplot2::discrete_scale}
#' @export
scale_fill_deadhead <- function(name = "dancing_bears", reverse = FALSE, ...) {
  pal <- ggrateful_palettes[[name]]
  if (is.null(pal)) {
    stop(sprintf(
      "Palette '%s' not found. Available palettes: %s",
      name, paste(names(ggrateful_palettes), collapse = ", ")
    ))
  }
  if (reverse) pal <- rev(pal)
  ggplot2::discrete_scale("fill", "deadhead", palette = scales::manual_pal(pal), ...)
}

#' Continuous color scale using a Grateful Dead gradient
#'
#' @param name Name of the gradient (see \code{names(ggrateful_gradients)})
#' @param reverse Logical; reverse the color order
#' @param ... Additional arguments passed to \code{ggplot2::scale_color_gradientn}
#' @export
scale_color_deadhead_c <- function(name = "best_of", reverse = FALSE, ...) {
  grad <- ggrateful_gradients[[name]]
  if (is.null(grad)) {
    stop(sprintf(
      "Gradient '%s' not found. Available gradients: %s",
      name, paste(names(ggrateful_gradients), collapse = ", ")
    ))
  }
  if (reverse) grad <- rev(grad)
  ggplot2::scale_color_gradientn(colours = grad, ...)
}

#' @rdname scale_color_deadhead_c
#' @export
scale_colour_deadhead_c <- scale_color_deadhead_c

#' Continuous fill scale using a Grateful Dead gradient
#'
#' @param name Name of the gradient (see \code{names(ggrateful_gradients)})
#' @param reverse Logical; reverse the color order
#' @param ... Additional arguments passed to \code{ggplot2::scale_fill_gradientn}
#' @export
scale_fill_deadhead_c <- function(name = "best_of", reverse = FALSE, ...) {
  grad <- ggrateful_gradients[[name]]
  if (is.null(grad)) {
    stop(sprintf(
      "Gradient '%s' not found. Available gradients: %s",
      name, paste(names(ggrateful_gradients), collapse = ", ")
    ))
  }
  if (reverse) grad <- rev(grad)
  ggplot2::scale_fill_gradientn(colours = grad, ...)
}

#' Display a Grateful Dead palette as color swatches
#'
#' @param name Name of the palette
#' @param labels Logical; show hex codes on each swatch
#' @return A ggplot object
#' @export
display_deadhead <- function(name, labels = TRUE) {
  pal <- ggrateful_palettes[[name]]
  if (is.null(pal)) {
    stop(sprintf(
      "Palette '%s' not found. Available palettes: %s",
      name, paste(names(ggrateful_palettes), collapse = ", ")
    ))
  }
  # use the gradient-ordered version if one exists, so ramped palettes
  # display in their smooth (not original) order
  if (!is.null(ggrateful_gradients[[name]])) pal <- ggrateful_gradients[[name]]
  df <- data.frame(x = seq_along(pal), hex = pal, stringsAsFactors = FALSE)

  p <- ggplot2::ggplot(df, ggplot2::aes(x = x, y = 1, fill = hex)) +
    ggplot2::geom_tile(color = "white", linewidth = 1) +
    ggplot2::scale_fill_identity() +
    ggplot2::coord_fixed(ratio = 1) +
    ggplot2::labs(title = name) +
    ggplot2::theme_void() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold", size = 14)
    )

  if (labels) {
    df$text_color <- ifelse(colSums(grDevices::col2rgb(df$hex) * c(0.299, 0.587, 0.114)) > 150,
                             "black", "white")
    p <- p + ggplot2::geom_text(
      data = df,
      ggplot2::aes(x = x, y = 1, label = hex, color = text_color),
      angle = 90, size = 3
    ) + ggplot2::scale_color_identity()
  }

  p
}

#' Display all Grateful Dead palettes at once
#'
#' Shows every palette in \code{ggrateful_palettes} stacked as rows of
#' color swatches, for quick comparison across the whole set.
#'
#' @param labels Logical; show hex codes on each swatch
#' @return A ggplot object
#' @export
display_deadhead_all <- function(labels = FALSE) {
  pal_names <- names(ggrateful_palettes)

  df <- do.call(rbind, lapply(pal_names, function(nm) {
    # use the gradient-ordered version if one exists, so ramped palettes
    # display in their smooth (not original) order
    pal <- if (!is.null(ggrateful_gradients[[nm]])) ggrateful_gradients[[nm]] else ggrateful_palettes[[nm]]
    data.frame(
      palette = nm,
      x = seq_along(pal),
      hex = pal,
      stringsAsFactors = FALSE
    )
  }))

  # keep palettes in a readable top-to-bottom order
  df$palette <- factor(df$palette, levels = rev(pal_names))

  df$text_color <- ifelse(
    colSums(grDevices::col2rgb(df$hex) * c(0.299, 0.587, 0.114)) > 150,
    "black", "white"
  )

  p <- ggplot2::ggplot(df, ggplot2::aes(x = x, y = palette, fill = hex)) +
    ggplot2::geom_tile(color = "white", linewidth = 0.8) +
    ggplot2::scale_fill_identity() +
    ggplot2::labs(title = "ggrateful color palettes", x = NULL, y = NULL) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold", size = 14),
      panel.grid = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(size = 9)
    )

  if (labels) {
    p <- p + ggplot2::geom_text(
      ggplot2::aes(label = hex, color = text_color),
      size = 2.2, angle = 90
    ) + ggplot2::scale_color_identity()
  }

  p
}
