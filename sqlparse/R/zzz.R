.onLoad <- function(libname, pkgname) {
    pkg_ns_env <- parent.env(environment())
    sqlparse <- reticulate::import_from_path("sqlparse", system.file("python", "sqlparse", package = packageName(), mustWork = TRUE))
    lapply(names(sqlparse), function(name) assign(name, sqlparse[[name]], pkg_ns_env))
}


##------------------------------------------------------------
## The below doesn't work, because (as documented in the man-page for assignInMyNamespace):
##   They can only be used to change the values of objects in the
##   namespace, not to create new objects.
##------------------------------------------------------------
## .onLoad <- function(libname, pkgname) {
##     sqlparse <- reticulate::import_from_path("sqlparse", system.file("python", "sqlparse", package = packageName(), mustWork = TRUE))
##     for(name in names(sqlparse)) {
##         assignInMyNamespace(name, sqlparse[[name]])
##     }
## }
