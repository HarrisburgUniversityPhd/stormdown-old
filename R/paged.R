#' Create a paged HTML dissertation document suitable for printing
#'
#' This output format is similar to \code{\link[pagedown]{thesis_paged}}.
#' The only difference is in the default stylesheets and Pandoc template.
#' @param ...,css,template Arguments passed to \code{\link[pagedown]{thesis_paged}()}.
#' @return An R Markdown output format.
#' @export
dissertation_paged <-
  function(
    ...,
    css = stormdown_resource('css', 'dissertation.css'),
    template = stormdown_resource('html', 'dissertation.html')) {
    thesis_paged(..., css = css, template = template) }

stormdown_resource = function(...) {
  system.file('resources', ..., package = 'stormdown', mustWork = TRUE)
}