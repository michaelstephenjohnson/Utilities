# R Snippets
# ==========
# SECTIONS (after Hadley's breakdown)
# S01: ingesting data
# S02: data manipulation
# S03: visualization
# S04: programming
# S05: package development

#  NOTE: all code presumes that core "Hadleyverse" has been installed and loaded

#******************************************************************************
# *** S01: ingesting data
#******************************************************************************
# download a file from a web site: 
fileURL <- "<file URL>"
download.file(fileURL,"<local file name>")
# read a CSV file:
chrdf <- read.csv("<file name>", header=FALSE, sep=",", colClasses=c("character"))
datdf <- data.frame(chrdf[[3]],
                    as.numeric(chrdf[[1]]), 
                    as.Date(chrdf[[7]], "%m/%d/%y"),
                    stringsAsFactors=FALSE
                    ) 
colnames(datdf) <- c("name1", "name2", "name3")

rm(chrdf)

#******************************************************************************
# *** S02: data manipulation
#******************************************************************************



#******************************************************************************
# *** S03: visualization
#******************************************************************************
# plot of single function
myfunc <- function (x) {
  return(x^2)
  }
x <- seq(-4,4,0.1)
y <- myfunc(x)
pd <-data.frame(x,y)
qplot(data=pd, x, y, geom="line", xlab="x", ylab="y")

# plot of multiple functions
myfunc1 <- function (x) {
  retval <- -(x^2) + (12 * x) - 24
  retval 
  }
myfunc2 <- function (x) {
  retval <- exp(-x/2) + 3
  retval 
  }
x <- seq(2,10,0.01)
y1 <- myfunc1(x)
y2 <- myfunc2(x)
pd <-data.frame(x,y1,y2)
pd2 <- gather(pd,f,y,y1:y2)
qplot(data=pd2, x, y, geom="line", colour=f, xlab="x", ylab="y")


