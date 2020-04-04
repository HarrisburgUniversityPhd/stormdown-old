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

### Day-to-day writing of your dissertation 

You need to edit the individual chapter R Markdown files to write your dissertation. 

You can write in the Rmd files without RStudio (in fact RStudio lacks some conveniences for writing, such as live spell-checking and live word count).
So you may prefer to do some writing and editing your Rmd files in your favourite text editor.
I frequently use [Atom](https://atom.io/), [Notepad++](https://notepad-plus-plus.org/), and [Emacs](https://www.gnu.org/software/emacs/).
But I come back to RStudio to create the PDF and work on the R code in my documents. 

While writing, you should `git commit` your work frequently, after every major activity on your dissertation.
For example, every few paragraphs or section of text, and after major step of analysis development. You should `git push` at the end of each work session before you leave your computer or change task.
For gentle novice-friendly guide to getting starting with using Git with R and RStudio, see <http://happygitwithr.com/>.

## Rendering

To render your dissertation into a PDF, open `index.Rmd` in RStudio and then click the "knit" button. To change the output formats between PDF, gitbook and Word , look at the `output:` field in `index.Rmd`and comment-out the formats you don't want.

Alternatively, if you're not using RStudio, you can use this from the R console, assuming your have set the `'index/` directory as your working directory:

```{r}
bookdown::render_book('index.Rmd')
```

The PDF file of your dissertation will be deposited in the `_book/` directory.

## Components

The following components are ones you should edit to customize your dissertation:

### `_bookdown.yml`

This is the main configuration file for your dissertation.
It determines what Rmd files are included in the output, and in what order.
Arrange the order of your chapters in this file and ensure that the names match the names in your folders. 

### `index.Rmd`

This file contains all the meta information that goes at the beginning of your
document. You'll need to edit this to put your name on the first page, the title of your dissertation, etc.

### `01-chap1.Rmd`, `02-chap2.Rmd`, etc.

These are the Rmd files for each chapter in your dissertation.
Write your dissertation in these.
If you're writing in RStudio, you may find the [wordcount addin](https://github.com/benmarwick/wordcountaddin) useful for getting word counts and readability statistics in R markdown documents.
You might also enjoy writing in these Rmd files with [Atom](https://atom.io/), [Notepad++](https://notepad-plus-plus.org/), [Sublime Text](https://www.sublimetext.com/), and [Emacs](https://www.gnu.org/software/emacs/). 

### `bib/`

Store your bibliography (as bibtex files) here.
We recommend using the [citr addin](https://github.com/crsh/citr) and [Zotero](https://www.zotero.org/) to efficiently manage and insert citations. 

### `csl/`

Specific style files for bibliographies should be stored here.
A good source for citation styles is https://github.com/citation-style-language/styles#readme

### `figure/` and `data/`

Store your figures and data here and reference them in your R Markdown files.
See the [bookdown book](https://bookdown.org/yihui/bookdown/) for details on cross-referencing items using R Markdown.

## Related projects

This project has drawn directly on code and ideas in the following:

* Ed Berry's blog post ['Writing your thesis with bookdown'](https://eddjberry.netlify.com/post/writing-your-thesis-with-bookdown/)
* Rosanna van Hespen's ([@rosannavhespen](https://twitter.com/rosannavhespen?lang=en)) five blog posts on ['Writing your thesis with R Markdown'](https://www.rosannavanhespen.nl/thesis_in_rmarkdown/)
* [huskydown](https://github.com/benmarwick/huskydown) by Ben Marwick at the University of Washington.
* [thesisdown](https://github.com/ismayc/thesisdown) by Chester Ismay at Reed College.
