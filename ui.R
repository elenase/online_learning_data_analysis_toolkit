p <- c("shiny", "shinydashboard", "dplyr", "data.table", "gridExtra", "rmarkdown", "knitr")
install.packages(p)

library(shiny)
library(shinydashboard)
library(dplyr)
library(data.table)
library(gridExtra)
library(rmarkdown)
library(knitr)


ui <- dashboardPage(skin='black',
                    ################# Main dashboard header        
                    dashboardHeader(
                      title= 'Toolkit for Humanitarian Data Analysis',
                      titleWidth = 400),
                    
                    ################## Side bar content
                    dashboardSidebar(
                      width = 400,
                      sidebarMenu(
                        menuItem("INTRODUCTION", tabName = "intro", icon = icon("info-circle")),
                        br(),
                        menuItem('NICE TO KNOW', tabName = 'knowledge', icon = icon("lightbulb-o")),
                        br(),
                        menuItem('CHARTS', tabName = 'charts', icon = icon("bar-chart")),
                          menuSubItem('Comparison', tabName = 'charts_compar'),
                          menuSubItem('Distribution', tabName = 'charts_dist'),
                          menuSubItem('Composition/Part-to-whole', tabName = 'charts_compos'),
                          menuSubItem('Relationship', tabName = 'charts_rela'),
                        br(),
                        menuItem('MAPPING', tabName = 'maps', icon = icon("globe")),
                        br(),
                        menuItem('STATISTICAL ANALYSIS', tabName = 'statistics', icon = icon("line-chart")),
                          menuSubItem('Probability and Statistics', tabName = 'statistics_prob'),
                          menuSubItem('Introductory Econometrics', tabName = 'statistics_intro'),
                          menuSubItem('Advanced Econometrics', tabName = 'statistics_adva'),
                          menuSubItem('Econometrics for Humanitarian Analyses', tabName = 'statistics_huma'),
                        br(),
                        menuItem('ON-LINE LEARNING', tabName = 'learning', icon = icon("book")),
                        br(),
                        menuItem('PIM', tabName = 'pim', icon = icon("connectdevelop")),
                        br(),
                        menuItem('CRISIS PHASE', tabName = 'crisis', icon = icon("support")),
                        br(),
                        menuItem('SOFTWARE REVIEW', tabName = 'software', icon = icon("check-square"))
                      )
                    
),
################## PAGE CONTENT BY SIDEBAR TAB ########################################################################################################
dashboardBody(
  tabItems(
    

################## TAB: INTRODUCTION CONTENT  #########################################################################################################

tabItem(tabName = "intro",
        fluidPage(
          
          box(
            title= "Description", width = 12, status = "warning",
            "This page highlights some important principles of data visualization and provides a collection of basic tutorials.",
            br(),
            "Every topic is linked to existing online learning material that should be used to train you further.",
            br(),
            br(),
            icon = icon("th"), href = "http://data.unhcr.org/imtoolkit/"
            )
          )
                 ),


################## TAB: NICE TO KNOW ##################################################################################################################

tabItem(tabName = "knowledge",
       fluidRow(
         box( title = "DESCRIPTION", width = 12, background = "teal",
              "description"),
         tabBox(
           title= "",
           id = "tabset1", width = 12,
           tabPanel("General material to data visualization", uiOutput('viZ_links_general'), width = NULL),
           tabPanel("Classification Algorithms", uiOutput('classification'), width = NULL),
           tabPanel("Working with Colors", uiOutput('color'), width = NULL)


           )
         )
       ),
         
         
         
       
       

################## TAB: CHARTS ########################################################################################################################

tabItem(tabName = "charts",
        fluidRow(
        box(
          title= "Description", width = 12, status = "warning",
          br(),
          p("hhhhhhhhhh")
          )
        )

),
################## SUBTAB: COMPARISON ################################################



tabItem(tabName = "charts_compar",
        fluidRow(
          column(width = 6,
            box( title = "Among items", width = NULL, background = "blue",
                    "description"),
            box( title= "Bar Chart", status = "primary"),
            box( title= "Column Chart", status = "primary")),
          column(width = 6,
            box( title = "Among items", width = NULL, background = "teal",
                       "description"),
            box( title= "Heat Map Chart", status = "info"),
            box( title= "Line Chart", status = "info"))
                )
        ),


################## SUBTAB: DISTRIBUTION ################################################

tabItem(tabName = "charts_dist",
           fluidRow(
             column(width = 4,
                box( title = "View Data Points", width = NULL, background = "blue",
                         "description"),
                box( title= "Column Histogram", status = "primary")),
             column(width = 4,
                box( title = "Two data points", width = NULL, background = "olive",
                         "description"),
                box(title= "Bubble Map", status = "success")),
             column(width = 4,
                    box( title = "Two data points", width = NULL, background = "teal",
                         "description"),
                    box(title= "Scatter Chart", status = "info"))
                    )
           ),
################## SUBTAB: COMPOSITION/PART-TO-WHOLE ###################################

tabItem(tabName = "charts_compos",
        fluidRow(
          column(width = 6,
                 box( title = "Static", width = NULL, background = "blue",
                      "description"),
                 box( title= "Pie Chart", status = "primary")),
          column(width = 6,
                 box( title = "Changing over time", width = NULL, background = "teal",
                      "description"),
                 box( title= "Stacked Area Chart", status = "info"),
                 box( title= "Stacked Column Chart", status = "info"))
        )
),
################## SUBTAB: RELATIONSHIP ################################################

tabItem(tabName = "charts_rela",
        fluidRow(
          column(width = 6,
                 box( title = "Two Variables", width = NULL, background = "blue",
                      "description"),
                 box( title= "Scatter Chart", status = "primary")),
          column(width = 6,
                 box( title = "Three Variable", width = NULL, background = "teal",
                      "description"),
                 box( title= "Bubble Chart", status = "info"))
        )
),





################## TAB: MAPPING #######################################################################################################################

tabItem(tabName = "maps",
        fluidRow(
          column(width = 6,
          box( title= "Bubble Map", status = "primary",
            br(), 
            p("hhhhhhhhhh")
          )),
          column(width = 6,
          box( title= "Choropleth Map", status = "warning",
            br(),
            p("hhhhhhhhhh")
          ))
          
        )
        ),




 

################## TAB: STATISTICAL ANANALYSIS ########################################################################################################

tabItem(tabName = "statistics",
        fluidRow(
          box( title = "Two Variables", width = 12, background = "teal",
               "description")
        )
), 

################## TAB: ONLINE LEARNING ################################################################################################################

tabItem(tabName = "learning",
        fluidRow(
          box( title = "MAPPING", width = 12, background = "olive",
               "description"),
          box( title= "ArcGIS Desktop", width = 4, status = "success", plotOutput('map_arcgis')),
          box( title= "ArcGIS Online", width = 4, status = "success"),
          box( title= "Carto", width = 4, status = "success"),
          box( title= "QGIS", width = 4, status = "success"),
          box( title= "R + RStudio", width = 4, status = "success"),
          box( title= "Google Earth", width = 4, status = "success"),
          box( title= "Google Maps API", width = 4, status = "success"),
          box( title= "Tableau", width = 4, status = "success"),
          box( title= "Microsoft Power BI", width = 4, status = "success"),
          box( title= "Excel Powermaps", width = 4, status = "success"),
          
          
          
          box( title = "Infographics", width = 12, background = "teal",
               "description"),
          box( title= "Excel", width = 4, status = "info"),
          box( title= "Microsoft Power BI", width = 4, status = "info"),
          box( title= "Tableau", width = 4, status = "info"),
          box( title= "PowerPoint", width = 4, status = "info"),
          box( title= "R + d3.js", width = 4, status = "info"),
          box( title= "R + dc.js", width = 4, status = "info"),
          box( title= "R + fusioncharts", width = 4, status = "info"),
          box( title= "R + leaflet", width = 4, status = "info"),
          box( title= "R + RStudio", width = 4, status = "info"),
          box( title= "Excel PowerQuery", width = 4, status = "info"),
          
          
          
          box( title = "Statistics", width = 12, background = "light-blue",
               "description"),
          box( title= "Excel", width = 4, status = "primary"),
          box( title= "SPSS", width = 4, status = "primary"),
          box( title= "R + RStudio", width = 4, status = "primary"),
          box( title= "Stata", width = 4, status = "primary"),
          box( title= "SAS", width = 4, status = "primary"),
          
          
          box( title = "Image Processing", width = 12, background = "yellow",
               "description"),
          box( title= "Adobe Illustrator", width = 4, status = "warning"),
          box( title= "Gimp", width = 4, status = "warning")
          
        )
), 

################## TAB: SOFTWARE REVIEW #################################################################################################################

tabItem(tabName = "software",
        fluidRow(
          box( title = "DESCRIPTION", width = 12, background = "teal",
               "description"),
          tabBox(
            title= "", width = 12,
            id = "tabset1", height = "250px",
            tabPanel("Price", "First content"),
            tabPanel("Usability"), "Tab content 3"))
        )

)
)
)

