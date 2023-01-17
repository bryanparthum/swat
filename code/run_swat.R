## Written by: US EPA, National Center for Environmental Economics; December 2022

##########################
#################  library
##########################

## Clear worksace
rm(list = ls())
gc()

## This function will check if a package is installed, and if not, install it
list.of.packages <- c('magrittr','tidyverse')
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos = "http://cran.rstudio.com/")
lapply(list.of.packages, library, character.only = TRUE)

##########################
#################### parts
##########################

## navigate to directory with executable 
setwd(paste0(getwd(), '/TxtInOut'))

## get path
project_path = getwd()

## function from SWATplusR
'%&&%' <- function(a, b) paste(a, b, sep = " ")
'%//%' <- function(a, b) paste(a, b, sep = "/")


## function from SWATplusR to get os
get_os <- function() {
  if (.Platform$OS.type == "windows") {
    "win"
  } else if (Sys.info()["sysname"] == "Darwin") {
    #"mac"
    stop("SWATplusR only supported for Windows and Linux")
  } else if (.Platform$OS.type == "unix") {
    "unix"
  } else {
    stop("Unknown OS")
  }
}

os <- get_os()

## find swat executable
if(os == "win") {
  swat_exe <- list.files(project_path) %>%
    .[grepl(".exe$",.)]
  
} else if(os == "unix") {
  swat_exe <- system("find"%&&%project_path%&&%"-executable -type f",
                     intern = T) %>%
    basename(.)
}

run_os <- function(exe, os) {
  if(os == 'unix') exe <- '.'%//%exe
  return(exe)
}

exe <- run_os(swat_exe, os)

## run swat
system(exe)

