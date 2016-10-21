###
###  R initialization
###
#******************************************************************************
#*** LOADING PACKAGES - to be run after STARTING RStudio
#******************************************************************************
# the Hadleyverse
packages <- c("devtools", "dplyr", "ggplot2", "ggvis", "lubridate", "magrittr", 
              "readr", "stringr", "tidyr")
lapply(packages, library, character.only=TRUE)

# Intro to Statistical Learning
library(ISLR)

# Statistical Rethinking
library(rethinking)

#******************************************************************************
#*** INSTALLING PACKAGES - to be run after UPDATING/INSTALLING R/RStudio
#******************************************************************************
# core "Hadleyverse":
#   devtools - package development
#   dplyr - data manipulation
#   ggplot2 - visualization
#   ggvis - dynamic visualization
#   lubridate - date and time handling
#   magrittr - forward pipe operator
#   readr - reading files
#   stringr - working with text strings
#   tidyr - make tidy data
# 
packages <- c("devtools", "dplyr", "ggplot2", "ggvis", "lubridate", "magrittr", 
              "readr", "stringr", "tidyr")
needed_pkgs <- setdiff(packages, rownames(installed.packages()))
if (length(needed_pkgs) > 0) { install.packages(needed_pkgs) }

#
# Intro to Statistical Learning
install.packages("ISLR")

#
# Statistical Rethinking
install.packages("coda", "mvtnorm")
library(devtools)
devtools:install_github("rmcelreath/rethinking")

#
# H2O machine learning package
#
# remove any previously installed H2O packages for R
if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }
# download packages that H2O depends on
pkgs <- c("methods","statmod","stats","graphics","RCurl","jsonlite","tools","utils")
for (pkg in pkgs) {
  if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
}
# now download and install H2O package for R
install.packages("h2o", type="source", repos=(c("http://h2o-release.s3.amazonaws.com/h2o/rel-turchin/3/R")))
