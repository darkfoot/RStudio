# rough tendency: little frequency -> less hits
# more interestingly: with high hits in text, the frequency is not very high
# => if you use many of the specified words, you tend to write long texts and are not trying to cram these in
# on the opposite site: few hits do not correlate to any specific frequency
# => there are short texts with many and short texts with few words, that fulfill the specification
plot(frequency_data$Freq..per.hundred ~ frequency_data$No..hits.in.text)
