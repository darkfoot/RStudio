library(plotly)
library(dplyr)

# group data by no of words in text
mean_freq <- frequency_data %>%
                group_by(No..words.in.text) %>%
                summarize(mean_freq = mean(Freq..per.hundred),
                          language = language)

# set x, y data for later plots
xb <- mean_freq$No..words.in.text[mean_freq$language == "B"]
yb <- mean_freq$mean_freq[mean_freq$language == "B"]
xa <- mean_freq$No..words.in.text[mean_freq$language == "A"]
ya <- mean_freq$mean_freq[mean_freq$language == "A"]

# get new data by smoothing with loess
smooth_b <- loess(yb ~ xb)
smooth_a <- loess(ya ~ xa)

# get mean
mean_a <- mean(ya)
mean_b <- mean(yb)

# get median
median_a <- median(ya)
median_b <- median(yb)

# plot data
fig <- plot_ly(x = xb,
               y = yb,
               type = "scatter",
               mode = "line",
               name = "Bri*ish")

fig <- add_trace(fig,
                 x = xa,
                 y = ya,
                 name = "M'uerica")

 fig <- add_trace(fig,
                  x = xb,
                  y = predict(smooth_b),
                  type = "scatter",
                  mode = "line",
                 name = "Bri*ish smooth")

fig <- add_trace(fig,
                 x = xa,
                 y = predict(smooth_a),
                 name = "M'uerica smooth")

fig <- add_trace(fig,
                 x = xa,
                 y = mean_a,
                 name = "M'uerica mean")

fig <- add_trace(fig,
                 x = xa,
                 y = mean_b,
                 name = "Bri*ish mean")

# fig <- add_trace(fig,
#                  x = xa,
#                  y = median_a,
#                  name = "M'uerica median")
# 
# fig <- add_trace(fig,
#                  x = xb,
#                  y = median_b,
#                  name = "Bri*ish median")

fig <- layout(fig, 
              title = "pornwords",
              scene = list(xaxis = "test"))

# show plot
fig
