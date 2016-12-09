
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



# SERVER LOGIC


### TEXT INPUTS FROM .Rmd FILES ###########################################
## NICE TO KNOW 
shinyServer(function(input, output) {
  
  output$viZ_links_general <- renderUI({
    rmarkdown::render(input = "viz_links.Rmd",
                      output_format = html_document(self_contained = TRUE),
                      output_file = 'viz_links.html')  
    shiny::includeHTML('viz_links.html') 
  }) 
  
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
  
  
  ## STATISTICS
  
  output$statprob <- renderUI({
    rmarkdown::render(input = "statistics_probability.Rmd",
                      output_format = html_document(self_contained = TRUE),
                      output_file = 'statistics_probability.html')  
    shiny::includeHTML('statistics_probability.html') 
  }) 
  
  output$introecon <- renderUI({
    rmarkdown::render(input = "introductory_econometrics.Rmd",
                      output_format = html_document(self_contained = TRUE),
                      output_file = 'introductory_econometrics.html')  
    shiny::includeHTML('introductory_econometrics.html') 
  }) 
  
  output$advanecon <- renderUI({
    rmarkdown::render(input = "advanced_econometrics.Rmd",
                      output_format = html_document(self_contained = TRUE),
                      output_file = 'advanced_econometrics.html')  
    shiny::includeHTML('advanced_econometrics.html') 
  }) 
  
  output$stathuman <- renderUI({
    rmarkdown::render(input = "humanitarian.Rmd",
                      output_format = html_document(self_contained = TRUE),
                      output_file = 'humanitarian.html')  
    shiny::includeHTML('humanitarian.html') 
  }) 
  
    

  
  ### DATA INPUT ###########################################
  


  
### CHART PLOTS #####################################################################

  
  # BAR CHART ##########################################


  
  
  
  
  # COLUMN CHART ##########################################
  
  
  output$plotColumnChart <- renderPlot({
    
    barplot(testdata, col ="darkgreen")
  })
  
  
  
  
  # HEAT MAP CHART ##########################################
  
  output$plotHeatMap <- renderPlot({
  #------------------
  # CREATE DATA FRAME
  #------------------
  df.team_data <- expand.grid(teams = c("Team A", "Team B", "Team C", "Team D")
                              ,metrics = c("Metric 1", "Metric 2", "Metric 3", "Metric 4", "Metric 5")
  )
  
  # add variable: performance
  set.seed(41)
  df.team_data$performance <- rnorm(nrow(df.team_data))
  
  #inspect
  head(df.team_data)
  
  
  
  #---------------------------
  # PLOT: heatmap
  # - here, we use geom_tile()
  #---------------------------
  
  ggplot(data = df.team_data, aes(x = metrics, y = teams)) +
    geom_tile(aes(fill = performance)) 
  
  })
  
  
  # PIE CHART
  slices <- c(10, 12,4, 16, 8)
  
  output$plotPieChart <- renderPlot({
  lbls <- c("US", "UK", "Australia", "Germany", "France")
  pie(slices, labels = lbls, main="Pie Chart of Countries")
  })
  
  
  # CHORD diagram
  

  
  
  
  
  
  
################## LEARNING PART - OUTPUT VARIABLE = "table"+"software"##################################################
  ## SELECTION OF STATISTICAL SOFTWARE COMPARISON EXCEL FILE FROM FOLDER
  
  output$contents <- renderTable({
    inFile <- input$stat_software_comparison
    
    if(is.null(inFile))
      return(NULL)
    file.rename(inFile$datapath,
                paste(inFile$datapath, ".xlsx", sep=""))
    read_excel(paste(inFile$datapath, ".xlsx", sep=""), 1)
  })
  
  ##### STATISTICS ####
  
  output$table_excel_stat <- renderDataTable({
    excel_stat
  }, escape = FALSE)
  
  output$table_r_stat <- renderDataTable({
    r_stat
  }, escape = FALSE)
  
  output$table_spss_stat <- renderDataTable({
    spss_stat
  }, escape = FALSE)
  
  output$table_pspp_stat <- renderDataTable({
    pspp_stat
  }, escape = FALSE)
  
  output$table_stata_stat <- renderDataTable({
    stata_stat
  }, escape = FALSE)
  
  output$table_sas_stat <- renderDataTable({
    sas_stat
  }, escape = FALSE)
  
  output$table_matlab_stat <- renderDataTable({
    matlab_stat
  }, escape = FALSE)
  
  
  ##### INFOGRAPHICS ####
  
  output$table_excel_infogr <- renderDataTable({
    excel_infogr
  }, escape = FALSE)
  
  output$table_r_infogr <- renderDataTable({
    r_infogr
  }, escape = FALSE)
  
  output$table_spss_infogr <- renderDataTable({
    spss_infogr
  }, escape = FALSE)
  
  output$table_pspp_infogr <- renderDataTable({
    pspp_infogr
  }, escape = FALSE)
  
  output$table_stata_infogr <- renderDataTable({
    stata_infogr
  }, escape = FALSE)
  
  output$table_sas_infogr <- renderDataTable({
    sas_infogr
  }, escape = FALSE)
  
  output$table_matlab_infogr <- renderDataTable({
    matlab_infogr
  }, escape = FALSE)
  
  output$table_tableau_infogr <- renderDataTable({
    tableau_infogr
  }, escape = FALSE)
  
  output$table_powerbi_infogr <- renderDataTable({
    powerbi_infogr
  }, escape = FALSE)
  
  
  ##### MAPPING ####

  output$table_arcgis_desktop <- renderDataTable({
    arcgis_desktop
  }, escape = FALSE)
  
  
  output$table_carto <- renderDataTable({
    carto
  })
  
  
  
})
  

    


