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

## run swat from the command line, answer here: https://superuser.com/questions/216629/can-i-run-a-windows-exe-file-on-linux
## in the terminal, navigate to the location of the executable
## then give the user permission to run the executable by typing (excluding the first "#")
# chmod a+x swat670.exe
## then run the executable (excluding the first "#")
# ./swat670.exe

