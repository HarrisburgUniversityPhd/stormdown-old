# Using `stormdown` to write your PhD dissertation

This walkthrough guides you through the process of how to use `stormdown` to write your PhD dissertation.
It should covers everything you should need to get started from a brand new PC.
If it does not, add an issue to the backlog or submit a PR.
If you have been using your PC for a while, chances are that most of the work is already done.
Feel free to skip steps you don't need (like installing R).


01. Setup the prerequisites.
    I recomend using [Chocolatey](https://chocolatey.org/install).
    * [R](https://cran.r-project.org/bin/windows/base/) + [R Studio](https://www.rstudio.com/products/rstudio/download/)
    * [RTools](https://cran.r-project.org/bin/windows/Rtools/)
    * [Pandoc](https://pandoc.org)
```{ps1}
if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv
choco install r.project -y
refreshenv
choco install r.studio -y
choco install rtools -y
choco install pandoc -y
```
02. Install the three needed fonts:
    * [EB Garamond](https://www.ctan.org/tex-archive/fonts/ebgaramond)
    * [Lato](https://www.ctan.org/tex-archive/fonts/lato)
    * [Source Code Pro](https://tug.org/FontCatalogue/sourcecodepro)
03. Open up [R Studio][rstudio](https://www.rstudio.com/)
04. Install LaTeX.
    By far the easiest way to install LaTeX on any platform is with the [`tinytex`](https://yihui.name/tinytex/) package:
```{r}
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()
# after restarting RStudio, confirm that you have LaTeX with 
tinytex:::is_tinytex()
```
05. Install `stormdown`
```{r}
if (!require('devtools')) install.packages('devtools')
devtools::install_github('markanewman/stormdown')
```
06. Create your files.
```{r}
rmarkdown::draft('myhu_dissertation', template = 'dissertation', package = 'stormdown', create_dir = T, edit = F)
```
07. Enjoy.
