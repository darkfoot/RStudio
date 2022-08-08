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

# plot data
plot_ly(x = xb,
        y = yb,
        type = "scatter",
        mode = "lines",
        name = "Bri*ish") %>%
  add_trace(x = xa,
            y = ya,
            name = "M'uerica") %>%
  add_trace(x = xb,
            y = predict(smooth_b),
            name = "Bri*ish smooth") %>%
  add_trace(x = xa,
            y = predict(smooth_a),
            name = "M'uerica smooth") %>%
  layout(title = "pornwords")

