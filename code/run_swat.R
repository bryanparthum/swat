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

## function from swat
'%&&%' <- function(a, b) paste(a, b, sep = " ")

## find swat executable
swat_exe = 
  system("find"%&&%project_path%&&%"-executable -type f",
       intern = T)

## run swat
system(swat_exe)
