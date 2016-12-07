#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

p <- c("shiny", "shinydashboard", "dplyr", "data.table", "gridExtra", "rmarkdown", "knitr")
install.packages(p)


library(shiny)
library(gridExtra)
library(rmarkdown)
library(knitr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$classification <- renderUI({
    rmarkdown::render(input = "classification_algorithms.Rmd",
                      output_format = html_document(self_contained = TRUE),
                      output_file = 'classification_algorithms.html')  
    shiny::includeHTML('classification_algorithms.html') 
}) 
  
  
  output$color <- renderUI({
    rmarkdown::render(input = "color.Rmd",
                      output_format = html_document(self_contained = TRUE),
                      output_file = 'color.html')  
    shiny::includeHTML('color.html') 
  }) 
    

  
  output$viZ_links_general <- renderUI({
    rmarkdown::render(input = "viz_links.Rmd",
                      output_format = html_document(self_contained = TRUE),
                      output_file = 'viz_links.html')  
    shiny::includeHTML('viz_links.html') 
  }) 
  
    
    
    
    
    
  
  
   
  output$map_arcgis <- renderTable({
    df <- read.csv("D:/PrivateData/Toolbox_R/webpage/csv/mapping_arcgis.csv", header = TRUE, stringsAsFactors = FALSE)
    x <- df
    table <- tableGrob(x)
    
  })
  
})
