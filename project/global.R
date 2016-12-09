p <- c("shiny", "shinydashboard", "rmarkdown", "circlize", "data.table", "xlsx", "plotly")
install.packages(p)
install.packages('rJava',,'http://www.rforge.net/')

library(shiny)          # Web App
library(shinydashboard) # Dashboard Styling
library(rmarkdown)      # Use of markdown files
library(circlize)       # Circular charts like chord diagram
library(data.table)     # Show data in a nice table 
library(xlsx)           # Read Excel workbook with possibility to select sheets
library(plotly)         # Package for many different types of bar charts
packageVersion('plotly')


options(stringsAsFactors=FALSE)
options(shiny.launch.browser=T)

source("data.R", local=TRUE)

