 # stormdown <img src="inst/rmarkdown/templates/dissertation/skeleton/figure/hu-100px.png" align="right" />

[![Travis-CI Build Status](https://travis-ci.org/markanewman/stormdown.svg?branch=master)](https://travis-ci.org/markanewman/stormdown) 

This project provides a template for writing a PhD dissertation in R Markdown, and rendering those files into a PDF formatted according to the requirements of Harrisburg University.

Unlike similar versions in [huskydown](https://github.com/benmarwick/huskydown) and [thesisdown](https://github.com/ismayc/thesisdown), the focus of this project lies heavily on the PDF version, since this is the only format that the HU administration accepts.
The PDF version is fully functional.
The word, gitbook and epub versions were removed as dead code.
I might develop them at a later time if needed/wanted.

If you are new to working with `bookdown` and `rmarkdown`, please read over the documentation available in stormdown PDF template (which you can create by following the simple instructions below) and the [bookdown book](https://bookdown.org/yihui/bookdown/).

Under the hood, the [Harrisburg University LaTeX template](https://github.com/markanewman/stormdown) is used to ensure that documents conform precisely to submission standards.
At the same time, composition and formatting can be done using lightweight [markdown](http://rmarkdown.rstudio.com/authoring_basics.html) syntax, and **R** code and its output can be seamlessly included using [rmarkdown](http://rmarkdown.rstudio.com).

## Using `stormdown` to write your PhD dissertation

### Initial setup

Using `stormdown` has some prerequisites, such as Pandoc, LaTeX and some fonts.
To compile PDF documents using **R**, you need to have Pandoc, LaTeX and several related packages installed.
If you have a recent version of  [RStudio](http://www.rstudio.com/products/rstudio/download/), then you already have Pandoc and don't need to do anything more about that. 

Next is LaTeX.
By far the easiest way to install LaTeX on any platform is with the [`tinytex`](https://yihui.name/tinytex/) package:

```{r}
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()
# after restarting RStudio, confirm that you have LaTeX with 
tinytex:::is_tinytex()
```

### Starting to write your dissertation

To use **stormdown** from [RStudio](http://www.rstudio.com/products/rstudio/download/):

1. Ensure that you have already installed LaTeX and the fonts described above, and are using the latest version of [RStudio](http://www.rstudio.com/products/rstudio/download/).
   You can use **stormdown** without RStudio.
   For example, you can write the Rmd files in your favourite text editor (e.g. [Atom](https://atom.io/), [Notepad++](https://notepad-plus-plus.org/)).
   But RStudio is probably the easiest tool for writing both R code and text in your dissertation. 
2. Install **stormdown** packages: 
   ```{r}
   if (!require("devtools")) install.packages("devtools")
   devtools::install_github("markanewman/stormdown")
   ```
3. Use the **New R Markdown** dialog to select **HU Dissertation**:
   1. File -> New File -> R Markdown -> 'From template' -> 'HU-Dissertation, and give your dissertation a **Name**.
   2. Or if you're not using RStudio, run this line in your R console to create a new PhD dissertation from the template:
      ```{r}
      rmarkdown::draft('myhu_dissertation', template = 'dissertation', package = 'stormdown', create_dir = T, edit = F)
      ```

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
