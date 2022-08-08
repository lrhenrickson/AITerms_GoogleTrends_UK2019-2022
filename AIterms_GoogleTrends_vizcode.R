# Code adapted from ESUDH2022 (Simone Rebora / Giovanni Pietro Vitali)
# Leah Henrickson (University of Leeds, 2022)

# Libraries

library(ggplot2)
library(dplyr)
library(plotly)
library(hrbrthemes)

# Dataset
data <- read.csv("AIterms_GoogleTrends_UK2019-2022.csv")

# Labels
f <- list(
  family = "Arial, monospace",
  size = 14,
  color = "#7f7f7f"
)
x <- list(
  title =  "Week",
  titlefont = f
)
y <- list(
  title = "Trendiness",
  titlefont = f
)

# Annotations
a <- list(
  text = "Leah Henrickson",
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.5,
  y = 0.98,
  showarrow = FALSE
)

b <- list(
  text = "",
  font = f,
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.5,
  y = 0.95,
  showarrow = FALSE
)

# Plotting
p <- plot_ly(x = data$Week, 
             y = data$algorithm,
             type = "scatter", 
             mode = "lines", 
             fill = "tozeroy",
             name = "algorithm") 

p <- p %>% add_trace(y = data$artificial.intelligence, 
                     name = "artificial intelligence") 

p <- p %>% add_trace(y = data$computer.vision, 
                     name = "computer vision") 

p <- p %>% add_trace(y = data$machine.learning, 
                     name = "machine learning") 

p <- p %>% add_trace(y = data$natural.language.processing, 
                     name = "natural language processing") 

p <- p %>% layout(xaxis = x, 
                  yaxis = y, 
                  title= "Google Trends for AI-Related Terms (UK, 2019-2022)",
                  annotations = list(a, b))

p
