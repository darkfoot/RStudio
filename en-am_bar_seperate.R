library(plotly)  # module we will use to plot

# create figure 1
fig1 <- plot_ly(x = frequency_data$No..words.in.text[frequency_data$language=="B"],  # set x-axis data
                y = frequency_data$Freq..per.hundred[frequency_data$language=="B"],  # set y-axis data
                type = "bar", # set type
                name = "Bri*ish") %>%                                                # set name for label and reference layout
    layout(yaxis = list(range = c(0, 3)))                                            # set range of y-axis to 0-3


# create figure 2, for reference see fig1
fig2 <- plot_ly(x = frequency_data$No..words.in.text[frequency_data$language=="A"],
                y = frequency_data$Freq..per.hundred[frequency_data$language=="A"],
                type ="bar",
                name = "M'uerica") %>%
  layout(yaxis = list(range = c(0, 3)))

# create final figure
fig <- subplot(fig1,         # add fig1 to fig
               fig2,         # add fig2 to fig
               nrows=2) %>%  # set number of rows and reference layout (leave out to make plots next of each other)
  
  layout(title = 'Whatever')  # set title

fig  # show figure
