 # stormdown <img src="inst/rmarkdown/templates/dissertation/skeleton/figure/hu-100px.png" align="right" />

[![Travis-CI Build Status](https://travis-ci.org/markanewman/stormdown.svg?branch=master)](https://travis-ci.org/markanewman/stormdown) 

This project provides two templates for writing a PhD dissertation in R Markdown, and rendering those files into a PDF formatted according to the requirements of Harrisburg University.

* A **Dissertation** in the traditional APA style.
* A **Dissertation Portfolio** containing several related works that make up a cohesive whole each presented in APA style.

Unlike similar versions in [huskydown](https://github.com/benmarwick/huskydown) and [thesisdown](https://github.com/ismayc/thesisdown), the focus of this project lies soly on the PDF version, since this is the only format that the HU administration accepts.
The PDF version is fully functional.
The word, gitbook and epub versions were removed as dead code.

If you are new to working with `bookdown` and `rmarkdown`, please read over the documentation available in stormdown PDF template (which you can create by following the simple instructions below) and the [bookdown book](https://bookdown.org/yihui/bookdown/).

Under the hood, the [Harrisburg University LaTeX template](https://github.com/markanewman/stormdown) is used to ensure that documents conform precisely to submission standards.
At the same time, composition and formatting can be done using lightweight [markdown](http://rmarkdown.rstudio.com/authoring_basics.html) syntax, and **R** code and its output can be seamlessly included using [rmarkdown](http://rmarkdown.rstudio.com).

## Using `stormdown` to write your PhD dissertation

Instructions on how to get started with `stormdown` can be found [here](./guidence/GettingStarted.md).
This covers everything you should need to get started on new PC.
Feel free sto skip steps you don't need (like installing R).

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
* [huskydown](https://github.com/benmarwick/huskydown) by Ben Marwick at the University of Washington.
* [thesisdown](https://github.com/ismayc/thesisdown) by Chester Ismay at Reed College.
