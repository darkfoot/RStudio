library(plotly)  # module we will use to plot
library(dplyr)   # module we will use to process data

# rework our data to batches of lengths
i <- 0  # counter for while loop
stepsize <- 200  # may be increased or decreased as needed

textlength <- list()  # list for text length
a_freq <- list()  # list for american frequency
b_freq <- list()  # list for english frequency

while(i < 16000) {
  textlength <- c(textlength, i)  # add the current counter to the list
  
  batch <- filter(frequency_data, frequency_data$No..words.in.text > i & frequency_data$No..words.in.text <= i + stepsize)  # get all data with a total number of words between i and i + stepsize
  en <- filter(batch, batch$language == "B") # filter batch by english texts
  am <- filter(batch, batch$language == "A") # filter batch by american texts
  
  a_freq <- c(a_freq, sum(am$Freq..per.hundred)/length(am$Freq..per.hundred)) # append the mean frequency of am to a_freq
  b_freq <- c(b_freq, sum(en$Freq..per.hundred)/length(en$Freq..per.hundred)) # append the mean frequency of en to b_freq
              
  i <- i + stepsize  # increment counter
}


# figure to plot data
fig <- plot_ly(x = textlength,
               y = b_freq,
               type = "scatter",
               mode = "lines", 
               name = "Bri*ish") %>%
  add_trace(x = textlength,  # overlay second data set with first one
          y = a_freq,
          type = "scatter",
          mode = "lines",
          name = "M'uerica",
          inherit = FALSE) %>%  # inheritance off, to be able to use the values from a_freq
  layout(title="whatever")

# show figure
fig

print("done")
