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
03. Open up [R Studio][rstudio](https://www.rstudio.com/)
04. Install the devolopment packages
```{r}
if(!require(devtools)) { install.packages('devtools') }
if(!require(roxygen2)) { install.packages('roxygen2') }
if(!require(pkgdown)) { install.packages('pkgdown') }
rstudioapi::restartSession()
```
05. Switch to the package folder.
    The cloned location can be anything you want.
	I used `D:/repos` so you may need to change the path in some of the following steps.
```{r}
setwd('D:/repos')
```
06. Clean then compile the `stormdown` package
```{r}
package <- 'stormdown'
package_path <- paste0('./', package)
unlink(paste0(package_path, c('/docs', '/man', '/NAMESPACE')), recursive = T)
devtools::document(package_path)
pkgdown::build_site(package_path)
devtools::check(package_path)
```
07. (re)Install the package
```{r}
lib <- library()
if(package %in% lib$results[,'Package']) { remove.packages(package) }
devtools::install(package_path, dep = T, upgrade = 'never')
rstudioapi::restartSession()
```
08. Create drafting directories
```{r}
working_dir <- getwd()
draft_dir <- paste0(working_dir, '/draft')
draft_t1_dir <- paste0(draft_dir, '/t1')
draft_t2_dir <- paste0(draft_dir, '/t2')
draft_t1_pdf <- paste0(draft_t1_dir, '/_book/dissertation.pdf')
draft_t2_pdf <- paste0(draft_t2_dir, '/_book/dissertationportfolio.pdf')
if (dir.exists(draft_dir)) unlink(draft_dir, recursive = T)
dir.create(draft_dir)
```
09. Generate the templates
```{r}
rmarkdown::draft(draft_t1_dir, template = 'dissertation', package = package, create_dir = T, edit = F)
rmarkdown::draft(draft_t2_dir, template = 'dissertationportfolio', package = package, create_dir = T, edit = F)
```
10. Compile the templates
```{r}
setwd(draft_t1_dir); bookdown::render_book('index.rmd')
setwd(draft_t2_dir); bookdown::render_book('index.rmd')
file.exists(draft_t1_pdf) & file.exists(draft_t2_pdf)
```
11. Cleanup
```{r}
setwd(working_dir)
unlink(draft_dir, recursive = T)
rm(list=ls())
rstudioapi::restartSession()
```
