#' A theme to apply 2DII plotting aesthetics
#'
#' A ggplot theme which can be applied to all graphs to appear according to 2DII
#' plotting aesthetics.
#'
#' @inheritParams ggplot2::theme_classic
#'
#' @return An object of class `r toString(class(theme_2dii()))`.
#' @export
#' @examples
#' library(ggplot2)
#'
#' class(theme_2dii())
#'
#' ggplot(mtcars) +
#'   geom_histogram(aes(mpg), bins = 10) +
#'   theme_2dii()
theme_2dii <- function(base_size = 12,
                       base_family = "Helvetica",
                       base_line_size = base_size/22,
                       base_rect_size = base_size/22) {
  supporting_elts_color <- "#C0C0C0"
  margin <- margin(5, 5, 5, 5)

  theme_classic(
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) %+replace%
    theme(
      axis.line = element_line(colour = supporting_elts_color),
      axis.ticks = element_line(colour = supporting_elts_color),
      axis.text = element_text(size = base_size * 10/12, margin = margin),
      axis.title = element_text(margin = margin),
      legend.text = element_text(size = base_size * 9/12, margin = margin),
      legend.title = element_blank(),
      plot.margin = unit(c(0.5, 1, 0.5, 0.5), "cm"),
      plot.title = element_text(
        hjust = 0.5, vjust = 0.5, face = "bold",
        size = base_size * 14/12,
        margin = margin(20, 2, 12, 2)
      )
    )
}
