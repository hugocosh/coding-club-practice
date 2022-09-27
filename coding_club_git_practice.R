
library(tidyverse)
library(plotly)

mtcars

# Field description
# mpg: Miles/(US) gallon
# cyl: Number of cylinders
# disp: Displacement (cu.in.)
# hp: Gross horsepower
# drat: Rear axle ratio
# wt: Weight (1000 lbs)
# qsec: 1/4 mile time
# vs: configuration of engine: V (e.g. V6) or straight
# am: Transmission (0 = automatic, 1 = manual)
# gear: Number of forward gears
# carb: Number of carburetors

glimpse(mtcars)

df <- mtcars

# select relevant columns, and rename some of the column names
df <- df %>% select(mpg, cylinders = cyl, weight = wt, transmission = am, engine_size = disp)

# compute average miles per gallon across the dataset (mean)
df %>% 
  summarise(mean_mpg = mean(mpg))

# same again, but this time grouping by number of cylinders
df %>% 
  group_by(cylinders) %>% 
  summarise(mean_mpg = mean(mpg))


# chart showing how engine size influences miles per gallon
ggplot(df, aes(x = engine_size, y = mpg)) + geom_point()


# plotly version of chart
gg <- ggplot(df, aes(x = engine_size, y = mpg, 
                     text = paste0(row.names(df)
                                   , ": engine size = ", engine_size
                                   , ", miles per gallon = ", mpg))) + 
                       geom_point()

ggplotly(gg, tooltip = "text")


