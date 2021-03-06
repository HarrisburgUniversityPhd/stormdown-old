% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/paged.R
\name{dissertation_paged}
\alias{dissertation_paged}
\title{Create a paged HTML dissertation document suitable for printing}
\usage{
dissertation_paged(
  ...,
  css = stormdown_resource("css", "dissertation.css"),
  template = stormdown_resource("html", "dissertation.html")
)
}
\arguments{
\item{..., css, template}{Arguments passed to \code{\link[pagedown]{thesis_paged}()}.}
}
\value{
An R Markdown output format.
}
\description{
This output format is similar to \code{\link[pagedown]{thesis_paged}}.
The only difference is in the default stylesheets and Pandoc template.
}
