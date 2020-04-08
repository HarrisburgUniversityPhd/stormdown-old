# Using `stormdown` to write your PhD dissertation

This walkthrough guides you through the process of how to use `stormdown` to write your PhD dissertation.
It should covers everything you should need to get started from a brand new PC.
If it does not, add an issue to the backlog or submit a PR.
If you have been using your PC for a while, chances are that most of the work is already done.
Feel free to skip steps you don't need (like installing R).

01. Setup the prerequisites.
    I recomend using [Chocolatey](https://chocolatey.org/install), but you can use any method you like.
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
02. Open up [R Studio][rstudio]
03. Install LaTeX.
    By far the easiest way to install LaTeX on any platform is with the [`tinytex`](https://yihui.name/tinytex/) package:
```{r}
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()
```
04. Restart [R Studio][rstudio] then run the following to test the LaTeX install.
```{r}
tinytex:::is_tinytex()
```
05. Install `stormdown` then restart [R Studio][rstudio]
```{r}
if (!require('devtools')) install.packages('devtools')
devtools::install_github('markanewman/stormdown', upgrade = 'never')
```
06. Restart [R Studio][rstudio] to refresh the template cache.
07. Create your files.
    File -> New File -> R Markdown... then choose 'From template', then choose 'HU-Dissertation, and enter `index` as the **Name**.
    Note that this will currently only **Knit** if you name the directory `index` at this step.
    Please note: both the folder and the entrypoint `rmd` file are called index.
    The file name must remain `index.rmd` but you may want to rename your directory to something more rememberable. 
    ![](rstudio-path.jpg)
    ![](new-template.jpg)
    If you are not using [R Studio][rstudio], the below commandline should help. 
```{r}
#only if not running RStudio
rmarkdown::draft('index', template = 'dissertation', package = 'stormdown', create_dir = T, edit = F)
```
08. Make sure your working directory is the same as the one you used to create the template.
    Files Tab -> Go To Folder -> More -> Set As Working Directory
![](working-dir.jpg)
    If you are not using [R Studio][rstudio], the below commandline should help. 
```{r}
#only if not running RStudio
setwd("index")
```
09. Knit the files.
    The first time you knit it will take a long time as the system automatically puls down all the LaTeX packages.
    Subsequent knits will be much faster.
10. Enjoy.

[rstudio]: https://www.rstudio.com/
