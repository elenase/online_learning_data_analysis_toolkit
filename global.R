

p <- c("shiny", "shinydashboard", "rmarkdown", "circlize", "data.table", "xlsx", "plotly")
install.packages(p)



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

createLink <- function(val) {
  sprintf('<a href="https://www.google.com/#q=%s" target="_blank" class="btn btn-primary">Info</a>',val)
}

