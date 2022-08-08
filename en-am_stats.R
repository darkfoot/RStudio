# get texts with frequency greater than 1
high_freq <- filter(frequency_data, frequency_data$Freq..per.hundred >= 1)

# sort into english and american
am <- filter(high_freq, high_freq$language == "A")
en <- filter(high_freq, high_freq$language == "B")

# get ratio of high_freq to total texts (in %)
am_ratio <- length(am$language) / length(frequency_data$language[frequency_data$language == "A"]) * 100
en_ratio <- length(en$language) / length(frequency_data$language[frequency_data$language == "B"]) * 100

# get average length (arithmetic middle)
am_len <- sum(am$No..words.in.text) / length(am$language)
en_len <- sum(en$No..words.in.text) / length(en$language)

# print results
print("absolute number of pornscripts with higher frequency than 1:")
print(paste("english: ", length(en$language)))
print(paste("american: ", length(am$language)))

print("ratio of pornscripts with higher frequency than 1:")
print(paste("english: ", en_ratio, "%"))
print(paste("american: ", am_ratio, "%"))

print("average length of those pornscripts: ")
print(paste("english: ", en_len))
print(paste("american: ", am_len))
