# Base image, see https://hub.docker.com/r/rocker/r-rmd
FROM rocker/r-rmd:latest

# Install java and package dependencies
RUN apt-get -y update && apt-get install -y \
   default-jdk-headless \
   libcurl4-openssl-dev \
   libssl-dev \
   libicu-dev \
   && R CMD javareconf \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/

# Install further R packages
RUN install2.r --error \
 --repos http://cloud.r-project.org \
   rJava \
   RJDBC \
   dplyr \
   tidyr \
   purrr \
   DBI \
   flexdashboard \
   shiny \
   DT \
   && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

COPY app /app

EXPOSE 3838

CMD ["Rscript", "/app/run_exception_db.R"]
