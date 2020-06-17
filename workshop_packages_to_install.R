###### CODE WORKING FOR R VERSION <= 3.6.3

install.packages("pacman")

pacman::p_load("yaml","data.table","stringr","readr","config","ggthemes",
               "ggplot2","prettydoc","rmarkdown","scales","tidyverse","dplyr",
               "kableExtra","RCurl")

###### INSTALL PrescRiptions from source

install.packages("05_PrescRiptions_project/packages/PrescRiptions_0.2.5.tar.gz", repos = NULL, type = "source")



