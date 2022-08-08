library(plotly)
library(dplyr)

mean_freq <- frequency_data %>%
                group_by(No..words.in.text) %>%
                summarize(mean_freq = mean(Freq..per.hundred),
                          language = language)

print(mean_freq)

plot_ly(x = mean_freq$No..words.in.text[mean_freq$language == "B"],
        y = mean_freq$mean_freq[mean_freq$language == "B"],
        type = "scatter",
        mode = "lines",
        name = "Bri*ish") %>%
  add_trace(x = mean_freq$No..words.in.text[mean_freq$language == "A"],
            y = mean_freq$mean_freq[mean_freq$language == "A"],
            name = "M'uerica")

