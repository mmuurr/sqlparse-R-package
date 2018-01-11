.SQLPARSE <- reticulate::import_from_path("sqlparse", system.file("python", "sqlparse", package = packageName()), delay_load = TRUE)

lapply(names(.SQLPARSE), function(name) {
    assign(name, .SQLPARSE[[name]], envir = parent.frame(2))
})
