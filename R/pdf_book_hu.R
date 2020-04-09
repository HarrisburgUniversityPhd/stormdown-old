#' Creates an R Markdown PDF dissertation document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using Harrisburg University PhD dissertation LaTeX template and cls files.
#'
#' @export
#' @param toc A Boolean (TRUE or FALSE) specifying whether table of contents should be created
#' @param toc_depth A positive integer
#' @param highlight Syntax highlighting style. Supported styles include "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock". Pass NULL to prevent syntax highlighting.
#' @param ... other arguments to bookdown::pdf_book
#' @return A modified \code{pdf_document} based on the Harrisburg University dissertation LaTeX template
#' @import bookdown
#' @examples
#' \dontrun{
#'  stormdown::pdf_book_hu()
#' }
pdf_book_hu <- function(toc = TRUE, toc_depth = 3, highlight = "default", ...) {

  fix_envs = function(x) {
    beg_reg <- '^\\s*\\\\begin\\{.*\\}'
    end_reg <- '^\\s*\\\\end\\{.*\\}'
    i3 = if (length(i1 <- grep(beg_reg, x))) (i1 - 1)[grepl("^\\s*$", x[i1 - 1])]

    i3 = c(i3,
          if (length(i2 <- grep(end_reg, x))) (i2 + 1)[grepl("^\\s*$", x[i2 + 1])]
    )
    if (length(i3)) x = x[-i3]
    x
  }

  base <- bookdown::pdf_book(
    toc = toc,
    toc_depth = toc_depth,
    highlight = highlight,
    latex_engine = 'xelatex',
    ...)

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- NA
  options(knitr.table.format = "latex") 

  old_opt <- getOption("bookdown.post.latex")
  options(bookdown.post.latex = fix_envs)  
  on.exit(options(bookdown.post.late = old_opt))

  base
}
