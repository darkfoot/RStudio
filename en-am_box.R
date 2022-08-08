# setting plotlayout
par(mfrow=c(1, 1))

# make a boxplot
boxplot(frequency_data$Freq..per.hundred ~ frequency_data$language, 
        names = c("m'uerica", "bri*ish"),  # set names for x-axis
        main = "Frequency of stuff in pornscripts",  # set title
        col = c("red", "blue"))   # set color of boxes

# calculate means
means <- c(mean(frequency_data$Freq..per.hundred[frequency_data$language == "A"]),  # mean for america
           mean(frequency_data$Freq..per.hundred[frequency_data$language == "B"]))  # mean for england

# plot means
points(x = c(1, 2),  # positions on x-axis
       y = means,  # positions on y-axis
       col = c("blue", "red"),  # color of points
       pch = 19)  # type of point
