library(plotly)

# regroup data to ranges of frequency
total <- frequency_data %>%  # get data
  mutate(freq_ranges = cut(Freq..per.hundred, seq(0, 2.2, 0.1))) %>%  # mutate to ranges of freq
  group_by(freq_ranges) %>%  # regroup
  summarize(avg_len = mean(No..words.in.text)) # get average text length of groups

en <- subset(frequency_data, frequency_data$language == "B") %>%  # get data
  mutate(freq_ranges = cut(Freq..per.hundred, seq(0, 2.2, 0.1))) %>%  # mutate to ranges of freq
  group_by(freq_ranges) %>%  # regroup
  summarize(avg_len = mean(No..words.in.text)) # get average text length of groups

am <- subset(frequency_data, frequency_data$language == "A") %>%  # get data
  mutate(freq_ranges = cut(Freq..per.hundred, seq(0, 2.2, 0.1))) %>%  # mutate to ranges of freq
  group_by(freq_ranges) %>%  # regroup
  summarize(avg_len = mean(No..words.in.text)) # get average text length of groups


# plot data
plot(x = freq_data$freq_ranges, 
     y = freq_data$avg_len,
     ylim = c(0, 4700),
     col = "black",
     main="Length of text sorted by frequency")
 
lines(x = am$freq_ranges, 
      y = am$avg_len,
      col = "red")

lines(x = en$freq_ranges, 
      y = en$avg_len,
      col = "blue")

legend("topleft",
       c("total", "Bri*ish", "M'uerica"),
       lty = c(1, 1, 1),
       col = c("black", "blue", "red"))