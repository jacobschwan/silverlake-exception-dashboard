library(rmarkdown)
app_name = file.path("/app","exception-dashboard.Rmd")
app_port <- 3838
ip <- "0.0.0.0"
print(paste0("the Shiny Web application runs on: http://", ip, ":", app_port, "/"))

rmarkdown::run(app_name, shiny_args = list(host = ip, port = app_port))
