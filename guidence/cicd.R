package <- 'stormdown'
package_path <- paste0('./', package)
devtools::install(package_path, dep = T, upgrade = 'never')
working_dir <- getwd()
draft_dir <- paste0(working_dir, '/draft')
if (dir.exists(draft_dir)) unlink(draft_dir, recursive = T)
dir.create(draft_dir)
template_names <- c('dissertation', 'dissertationportfolio')
for(i in 1:length(template_names))
    dir.create(paste0(draft_dir, '/t', i))
for(i in 1:length(template_names))
    rmarkdown::draft(paste0(draft_dir, '/t', i, '/index'), template = template_names[i], package = package, create_dir = T, edit = F)
for(i in 1:length(template_names)) {
    setwd(paste0(draft_dir, '/t', i, '/index'))
    env_t <- new.env()
    bookdown::render_book('index.rmd', envir = env_t)
}
exists <- T
for(i in 1:length(template_names))
    exists <- exists & file.exists(paste0(draft_dir, '/t', i, '/index/_book/', template_names[i],'.pdf'))
exists
