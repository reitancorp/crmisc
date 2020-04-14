#' @title theme_wernicke_base()
#'
#' @description the base for my personal ggplot themes. This one is not very interesting on its own, but can be used as a foundation for theme customing.
#'
#' @return NULL
#'
#' @examples p + theme_wernicke_grey()
#'
#' @export

theme_wernicke_base <- function() {
  theme_classic(base_size = 9, base_family = 'Garamond') %+replace% #'Smoothy Sans'
    theme(
      panel.background = element_blank(),
      plot.background = element_blank(),
      legend.background = element_rect(fill = "transparent", colour=NA),
      legend.key        = element_rect(fill = "transparent", colour=NA),
      panel.grid.major.y = element_line(colour = 'white', size = 0.5),
      axis.line.y = element_blank(),
      axis.line.x = element_blank(),
      axis.ticks = element_blank(),
      legend.position = 'bottom'

    )
}

#' @title theme_wernicke_grey()
#'
#' @description A light grey version of my theme. Works well with viridis() colors
#'
#' @return NULL
#'
#' @examples p + scale_fill_viridis_d() + theme_wernicke_grey()
#'
#' @export

theme_wernicke_grey <- function() {
  theme_wernicke_base() %+replace%
    theme(
      plot.background = element_rect(fill =  'grey96', colour = NA),
      panel.grid.major.y = element_line(colour = 'white', size = 0.5)
    )
}


#' @title theme_wernicke_white()
#'
#' @description A version of my theme with white background. Looks nice with viridis and magma colors.
#'
#' @return NULL
#'
#' @examples p + scale_fill_viridis_d() + theme_wernicke_white()
#' p + scale_fill_manual(values = wes_palette("Zissou1")) + theme_wernicke_white()
#'
#' @export
theme_wernicke_white <- function() {
  theme_wernicke_base() %+replace%
    theme(
      plot.background = element_rect(fill =  'white', colour = NA),
      panel.grid.major.y = element_line(colour = 'grey96', size = 0.5)
    )
}

#' @title theme_wernicke_dark()
#'
#' @description A dark version of my theme. Does not work very well yet, but I am sure it has potential.
#'
#' @return NULL
#'
#' @examples p + scale_fill_viridis_d() + theme_wernicke_dark()
#' p + scale_fill_manual(values = wes_palette("FantasticFox1")) + theme_wernicke_dark()
#'
#' @export
theme_wernicke_dark<- function() {
  theme_wernicke_base() %+replace%
    theme(
      plot.background = element_rect(fill =  'grey35', colour = NA),
      panel.grid.major.y = element_line(colour = 'grey50', size = 0.5)
    )
}


#' @title wesanderson_color()
#'
#' @description Convenience function for using a wesanderson package color palette.
#'
#' @param string_color A string corresponding to a color palette from the wesanderson package.
#'
#' @examples p + theme_wernicke_grey() + wesanderson_color("Zissou1")
#'
#' @export
wesanderson_color <- function(string_color, ...){
  scale_fill_manual(values = wes_palette(string_color, ...))
}


#' @title wer_classic()
#'
#' @description A classic wernicke theme
#'
#' @export
#'
wer_classic <- function(base_size = 11, base_family = "Gill Sans",
            base_line_size = base_size / 22,
            base_rect_size = base_size / 22) {
  theme_bw(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  ) %+replace%
    theme(
      # no background and no grid
      panel.border     = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),

      # show axes
      axis.line      = element_line(colour = "black", size = rel(1)),

      # match legend key to panel.background
      legend.key       = element_blank(),

      # simple, black and white strips
      strip.background = element_rect(fill = "white", colour = "black", size = rel(2)),
      # NB: size is 1 but clipped, it looks like the 0.5 of the axes

      complete = TRUE
    )
}

