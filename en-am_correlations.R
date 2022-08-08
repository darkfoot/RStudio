# set plotting area to 3 plots high and 4 plots wide
par(mfrow=c(3, 4))

# plot no. words against everything
plot(frequency_data$No..words.in.text ~ frequency_data$No..words.in.text)
plot(frequency_data$No..words.in.text ~ frequency_data$No..hits.in.text)
plot(frequency_data$No..words.in.text ~ frequency_data$Freq..per.hundred)
boxplot(frequency_data$No..words.in.text ~ frequency_data$language)

# plot no. of hits against everything
plot(frequency_data$No..hits.in.text ~ frequency_data$No..words.in.text)
plot(frequency_data$No..hits.in.text ~ frequency_data$No..hits.in.text)
plot(frequency_data$No..hits.in.text ~ frequency_data$Freq..per.hundred)
boxplot(frequency_data$No..hits.in.text ~ frequency_data$language)

# plot freq. per hundred against everything
plot(frequency_data$Freq..per.hundred ~ frequency_data$No..words.in.text)
plot(frequency_data$Freq..per.hundred ~ frequency_data$No..hits.in.text)
plot(frequency_data$Freq..per.hundred ~ frequency_data$Freq..per.hundred)
boxplot(frequency_data$Freq..per.hundred ~ frequency_data$language)
