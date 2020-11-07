package <- 'stormdown'
package_path <- paste0('./', package)
devtools::install(package_path, dep = T, upgrade = 'never')
working_dir <- getwd()
draft_dir <- paste0(working_dir, '/draft')
if (dir.exists(draft_dir)) {
    unlink(draft_dir, recursive = T)}
dir.create(draft_dir)
template_names <- c('dissertation')
for(i in 1:length(template_names)) {
    dir.create(paste0(draft_dir, '/t', i))}
for(i in 1:length(template_names)) {
    rmarkdown::draft(
        paste0(draft_dir, '/t', i, '/', template_names[i]),
        template = template_names[i],
        package = package,
        create_dir = F,
        edit = F)}
for(i in 1:length(template_names)) {
    setwd(paste0(draft_dir, '/t', i))
    env_t <- new.env()
    rmarkdown::render(paste0(template_names[i], '.rmd'), envir = env_t)
}
exists <- T
for(i in 1:length(template_names)) {
    exists <- exists & file.exists(paste0(draft_dir, '/t', i, '/', template_names[i], '.html'))}
exists
