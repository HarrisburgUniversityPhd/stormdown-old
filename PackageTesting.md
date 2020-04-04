# Testing the Package

Good science is based on reproduceability.
Good engenering is the same, we just call it testing.
The following steps can be taken by a **devoloper** to rebuild the package.
If you are a **user**, the standard [instalation procedure](./README.md) is what you want.

01. Setup the prerequisites.
    I recomend using [Chocolatey](https://chocolatey.org/install).
    * [7-zip](https://www.7-zip.org/)
    * [R](https://cran.r-project.org/bin/windows/base/) + [R Studio](https://www.rstudio.com/products/rstudio/download/)
    * [RTools](https://cran.r-project.org/bin/windows/Rtools/)
    * [Pandoc](https://pandoc.org)
```{ps1}
if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv
choco install 7zip.install -y
choco install r.project -y
refreshenv
choco install r.studio -y
choco install rtools -y
choco install pandoc -y
```
02. Clone the [repo](https://github.com/markanewman/stormdown) from [GitHub](https://github.com) 
03. Open up [R Studio][rstudio](https://www.rstudio.com/) and switch to the project folder.
    The cloned location can be anything you want.
	I used `D:/repos/stormdown` so you may need to change the path in some of the following steps.
```{r}
setwd('D:/repos/stormdown')
```
04. Install the devolopment packages
```{r}
install.packages('devtools')
install.packages('roxygen2')
install.packages('pkgdown')
```
05. Clean then compile the project
```{r}
unlink(c("./docs/*", "./man/*", "./NAMESPACE"), recursive = T)
devtools::document()
pkgdown::build_site()
devtools::check()
```
06. (re)Install the templates
```{r}
lib <- library()
if('stormdown' %in% lib$results[,'Package']) { remove.packages('stormdown'); rstudioapi::restartSession() }
devtools::install_local('D:/repos/stormdown', dep = T, upgrade = 'never')
rstudioapi::restartSession()
```
07. Move to a drafting directory
```{r}
if (dir.exists('draft')) unlink('draft', recursive = T)
dir.create('draft')
```
08. Generate and compile the Dissertation template
```{r}
rmarkdown::draft('draft/t1', template = 'dissertation', package = 'stormdown', create_dir = T, edit = F)
setwd('d:/repos/stormdown/draft/t1')
bookdown::render_book('index.rmd')
```
