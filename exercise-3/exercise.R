# Install Plotly 
library(plotly)

# Use the plot_ly function to test it out and see that it is working
# create a variable and pass in the plot_ly function that takes in 
# the data midwest, sets the x to ~percollege, the color to ~state 
# and the type to "box" 
plot_ly(data = midwest, x = ~percollege, color = ~state, type="box")

# Make two vectors of numbers between 1 and 10, with each vector having 10 numbers in it
v1 <- c(1:10)
v2 <- c(1:10)

# create a data frame of the two vectors 
df <- data.frame(v1, v2)

# now create a basic scatterplot using the data frame you just created, passing it into 
# a variable
my.plot <- plot_ly(data = df, x = v1, y = v2)

# Call your variable and enjoy your awesome plot! 
my.plot

# Now create a new variable styled.scatterplot. Using the same data and scatterplot
# as from earlier, but you are going to change the markers.  Make it so the 
# markers are size 10, of a color of your choice.  Finally change the boarder,
# of the markers to a differnet color with a widthe of 2
styled.scatterplot <- plot_ly(data = df,  x = v1, y = v2, 
                              marker = list(size = 10,
                                            color = "#e2301f",
                                            line = list(color = "#3d0601",
                                                        width = 2)))%>% 
  layout(title = 'My Plot',
         yaxis = list(zeroline = FALSE),
         xaxis = list(zeroline = FALSE))

# Call the style.scatterplot variable and see what has changed. Finally add
# add a pipe operator and use the layout function to add a title and set the
# x and y axis to have zeroline = FALSE 

# load in the data set diamonds 
data("diamonds")

# Use sample() and nrow() to only take a random sampling of 1000 rows from the
# diamonds data and pass that into a new variable
v3 <- diamonds[sample(nrow(diamonds), 1000), ]

# Now create a new plot passing in your sample of a 1000 rows from the diamonds
# data, set x, y, and z axis as carat, price, and depth.  
# Finally add makers that is the titled "Clarity, and adds the Clarity of the 
# diamonds
diamond.plot <- plot_ly(v3, x = ~carat, y = ~price, z = ~depth) %>% 
  add_markers(text = ~paste("Clarity:", clarity))

#Bonus 
# For this you will make a graph with two differnet Y axis 
# crete a variable that will have the information for the second Y axis
# for this the font should be red, overlaying = "y", on the right side, 
# and should have a title distinguishing it as the second y axis. 
second.axis <- list(
  tickfont = list(color = "red"),
  overlaying = "y",
  side = "right",
  title = "second y axis"
)


# Now call the plot_ly() funcion and use pipe operators to have two add_line
# functions. The first will have x values from 1:3 and y value of 10*(1:3)
# The second will have x values from 2:4 and y values from 1:3.  Both shoud
# be named something different.  Finally have a pipe operator connecting the
# layout() function and add a title for the graph, set the yaxis2 to the previous
# variable and have a title for the xaxis  
plot_ly() %>%
  add_lines(x = ~1:3, y = ~10*(1:3), name = "slope of 10") %>%
  add_lines(x = ~2:4, y = ~1:3, name = "slope of 1", yaxis = "y2") %>%
  layout(
    title = "Double Y Axis", yaxis2 = second.axis,
    xaxis = list(title="x")
  )











