 # stormdown <img src="inst/rmarkdown/templates/dissertation/skeleton/figure/hu-100px.png" align="right" />

[![Travis-CI Build Status](https://travis-ci.org/markanewman/stormdown.svg?branch=master)](https://travis-ci.org/markanewman/stormdown) 

This project provides two templates for writing a PhD dissertation in R Markdown, and rendering those files into a PDF formatted according to the requirements of Harrisburg University.

* A **Dissertation** in the traditional APA style.
* A **Dissertation Portfolio** containing several related works that make up a cohesive whole each presented in APA style.

Unlike similar versions in [huskydown](https://github.com/benmarwick/huskydown) and [thesisdown](https://github.com/ismayc/thesisdown), the base of this project is [pagedown](https://github.com/rstudio/pagedown).
This allows for greater cross platform (PC/Mac) compatability because the rendering of the PDF is done in [Chrome](https://www.google.com/chrome/).

If you are new to working with `rmarkdown`, please read over the documentation available in stormdown PDF template itself, the [rmarkdown book](https://bookdown.org/yihui/rmarkdown/), the [rmarkdown cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/), or the [pagedown book](https://pagedown.rbind.io/)

## Using `stormdown` to write your PhD dissertation

Instructions on how to get started with `stormdown` can be found [here](./guidence/GettingStarted.md).
This covers everything you should need to get started on new PC.
Feel free to skip steps you don't need (like installing R).

## Day-to-day Research

I deal with large analyses that take a long time to run.
If you have a similar sort of requirment, I recomend [this](./guidence/DayToDayResearch.md) to help guide your day-to-day research process.
To be clear, `stormdown` can be used on any Harrisburg University dissertation, but sometimes it helps to see the process of another researcher.

## (Re)build the package

Instructions on how to rebuild the package for an updated distribution can be found [here](./guidence/PackageTesting.md).
This knoledge is not necessary of the avarage user.

## Related projects

This project has drawn directly on code and ideas in the following:

* Ed Berry's blog post ['Writing your thesis with bookdown'](https://eddjberry.netlify.com/post/writing-your-thesis-with-bookdown/)
* Rosanna van Hespen's ([@rosannavhespen](https://twitter.com/rosannavhespen?lang=en)) five blog posts on ['Writing your thesis with R Markdown'](https://www.rosannavanhespen.nl/thesis_in_rmarkdown/)
* [thesisdown](https://github.com/ismayc/thesisdown) by Chester Ismay at Reed College.
* [huskydown](https://github.com/benmarwick/huskydown) by Ben Marwick at the University of Washington.
* [pagedown] (https://github.com/rstudio/pagedown)
