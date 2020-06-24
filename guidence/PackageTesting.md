# Testing the Package

Good science is based on reproducibility.
Good engineering is the same; we call it testing.
The following steps can be taken by a **developer** to rebuild the package.
If you are a **user**, the standard [instalation procedure](./README.md) is what you want.
The testing guidance is Windows-centric, but similar steps should run on Mac or Linux.

## Local testing

01. Setup the prerequisites.    
    * [R](https://cran.r-project.org/bin/windows/base/) (3.6.3) + [R Studio](https://www.rstudio.com/products/rstudio/download/) (1.2.5033)
    * [RTools](https://cran.r-project.org/bin/windows/Rtools/) (3.5.0.4)
    * I recommend using [Chocolatey](https://chocolatey.org/install), but you can use any method you like.
      Open a Powershell prompt in admin mode and run the below commands.
```{ps1}
if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv
choco install r.project --version=3.6.3 -y
refreshenv
choco install r.studio --version=1.2.5033 -y
choco install rtools --version=3.5.0.4 -y
```
02. Open up [R Studio][rstudio](https://www.rstudio.com/)
03. Install the R packages: `rmarkdown` (2.3), `bookdown` (0.20), `tinytex` (0.24), `devtools` (2.3.0), `roxygen2` (7.1.0), `pkgdown` (1.5.1), `kableExtra` (1.1.0), `dplyr` (1.0.0), and `ggpubr` (0.3.0).
    * `roxygen2` and `pkgdown` are only needed as part of the build process.
    * `kableExtra`, `rlang`, `dplyr`, and `ggpubr` are only used in the sample sections.
      You only need them to test the inital Knit.
    * In order to pin the version of the packages, set the repo to a snapshot version.
```{r}
r <- getOption('repos')
r['CRAN'] <- 'https://mran.microsoft.com/snapshot/2020-06-24'
options(repos = r)
install.packages(c('rmarkdown', 'bookdown', 'tinytex'))
install.packages(c('devtools', 'roxygen2', 'pkgdown'))
install.packages(c('kableExtra', 'dplyr', 'ggpubr'))
rstudioapi::restartSession()
```
04. Install LaTeX.
    There will be a couple of popups complaining about missing DLLs, ignore those.
```{r}
tinytex::install_tinytex()
```
05. Restart [R Studio][rstudio] then run the following to test the LaTeX install.
```{r}
tinytex:::is_tinytex()
```
06. Clone the [repo](https://github.com/markanewman/stormdown) from [GitHub](https://github.com) and switch to that folder.
    The cloned location can be anything you want.
	I used `D:/repos/markanewman` so you may need to change the path in some of the following steps.
    Downloading the zip and extracting it to `D:/repos/markanewman` should also work just fine.
```{r}
setwd('D:/repos/markanewman')
```
07. Clean then compile the `stormdown` package
```{r}
package <- 'stormdown'
package_path <- paste0('./', package)
unlink(paste0(package_path, c('/docs', '/man', '/NAMESPACE')), recursive = T)
devtools::document(package_path)
pkgdown::build_site(package_path)
devtools::check(package_path)
```
08. (re)Install the package
```{r}
lib <- library()
if(package %in% lib$results[,'Package']) { remove.packages(package) }
devtools::install(package_path, dep = T, upgrade = 'never')
rstudioapi::restartSession()
```
09. Create drafting directories
```{r}
working_dir <- getwd()
draft_dir <- paste0(working_dir, '/draft')
if (dir.exists(draft_dir)) unlink(draft_dir, recursive = T)
dir.create(draft_dir)
template_names <- c('dissertation', 'dissertationportfolio')
for(i in 1:length(template_names))
    dir.create(paste0(draft_dir, '/t', i))
```
10. Generate the templates
```{r}
for(i in 1:length(template_names))
    rmarkdown::draft(
        paste0(draft_dir, '/t', i, '/index'),
        template = template_names[i],
        package = package,
        create_dir = T,
        edit = F)
```
11. Compile the templates.
    Make sure to use a new enviroment because this more closely resembles the end user clicking the knit button
```{r}
for(i in 1:length(template_names)) {
    setwd(paste0(draft_dir, '/t', i, '/index'))
    env_t <- new.env()
    bookdown::render_book('index.rmd', envir = env_t)
}
exists <- T
for(i in 1:length(template_names))
    exists <- exists & file.exists(paste0(draft_dir, '/t', i, '/index/_book/', template_names[i],'.pdf'))
exists
```
12. Review the PDFs
13. Cleanup
```{r}
setwd(working_dir)
unlink(draft_dir, recursive = T)
rm(list=ls())
rstudioapi::restartSession()
```

## Docker Testing

01. Setup the prerequisites.
    * [Docker Desktop](https://www.docker.com/products/docker-desktop)
    * I recommend using [Chocolatey](https://chocolatey.org/install), but you can use any method you like.
      Open a Powershell prompt in admin mode and run the below commands.
```{ps1}
if('Unrestricted' -ne (Get-ExecutionPolicy)) { Set-ExecutionPolicy Bypass -Scope Process -Force }
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
refreshenv
choco install docker-desktop -y
```
02. Clone the [repo](https://github.com/markanewman/stormdown) from [GitHub](https://github.com)
03. Run Docker Desktop
04. Open a regular Powershell prompt
05. Switch to the package folder.
    The cloned location can be anything you want.
	I used `D:/repos` so you may need to change the path in some of the following steps.
```{ps1}
d:
cd d:/repos/markanewman/stormdown
```
06. Build the docker image then make and run a container-based off of that image
```{ps1}
docker build -t stormdown:local .
docker run --name my_stormdown stormdown:local
```
07. Copy the generated PDFs out of the container
```{ps1}
docker cp my_stormdown:/draft/t1/index/_book/dissertation.pdf dissertation.pdf
docker cp my_stormdown:/draft/t2/index/_book/dissertationportfolio.pdf dissertationportfolio.pdf
```
08. Review the PDFs
09. Cleanup
```{ps1}
docker rm my_stormdown
docker rmi stormdown:local
```
