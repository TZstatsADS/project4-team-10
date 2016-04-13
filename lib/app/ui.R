#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(dplyr)
library(splitstackshape)
library(ggplot2)
library(shinydashboard)
# Define UI for application that draws a histogram
shinyUI(navbarPage("Movie Movie Movie",theme = "back.css",
                   tabPanel("dataAnalysis",  
                            # Sidebar with a selector input for neighborhood
                            sidebarLayout(position="left",
                                          sidebarPanel(
                                            conditionalPanel(condition="input.conditionedPanels==1",
                                                             helpText("Give the overall analysis"),
                                                             br(),
                                                             selectInput("Plot", "Analysis",
                                                                         c("Year", "Awards"))
                                            ),
                                            conditionalPanel(condition="input.conditionedPanels==2",
                                                             helpText("Choose the genre"),
                                                             hr(),
                                                             selectInput("genre", "Genre (a movie can have multiple genres)",
                                                                         c( "Action", "Adventure", "Animation", "Biography", "Comedy",
                                                                            "Crime", "Documentary", "Drama", "Family", "Fantasy", "History",
                                                                            "Horror", "Music", "Musical", "Mystery", "Romance", "Sci-Fi",
                                                                            "Short", "Sport", "Thriller", "War", "Western"))
                                            )
                                          ),
                                          mainPanel(
                                            tabsetPanel(type="pill",
                                                        
                                                        tabPanel("Analysis", br(),plotlyOutput("distplot1") , value=1), 
                                                        
                                                        tabPanel("Genre Analysis", br(), plotlyOutput("distplot2"), value=2),
                                                        
                                                        id = "conditionedPanels"
                                            )
                                          )
                            )
                            
                            
                   )
))