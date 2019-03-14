getwd()
library(dplyr)
curry <- read.csv("/Users/akhilperimbeti/Desktop/stat133/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)
durant <- read.csv("/Users/akhilperimbeti/Desktop/stat133/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("/Users/akhilperimbeti/Desktop/stat133/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE)
thompson <- read.csv("/Users/akhilperimbeti/Desktop/stat133/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE)
green <- read.csv("/Users/akhilperimbeti/Desktop/stat133/workout01/data/draymond-green.csv", stringsAsFactors = FALSE)

curry <- mutate(curry, player_name = "Stephen Curry")
iguodala <- mutate(iguodala, player_name = "Andre Iguodala")
durant <- mutate(durant, player_name = "Kevin Durant")
thompson <- mutate(thompson, player_name = "Klay Thompson")
green <- mutate(green, player_name = "Draymond Green")

curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes" 
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- "shot_yes" 
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- "shot_no" 
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- "shot_yes" 
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- "shot_no" 
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- "shot_yes" 
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- "shot_no" 
green$shot_made_flag[green$shot_made_flag == 'y'] <- "shot_yes" 
green$shot_made_flag[green$shot_made_flag == 'n'] <- "shot_no" 

curry <- mutate(curry, minute = (12*period - minutes_remaining))
thompson <- mutate(thompson, minute = (12*period - minutes_remaining))
green <- mutate(green, minute = (12*period - minutes_remaining))
iguodala <- mutate(iguodala, minute = (12*period - minutes_remaining))
durant <- mutate(durant, minute = (12*period - minutes_remaining))

sink("/Users/akhilperimbeti/Desktop/stat133/workout01/output/stephen-curry-summary.txt")
summary(curry)
sink()

sink("/Users/akhilperimbeti/Desktop/stat133/workout01/output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink("/Users/akhilperimbeti/Desktop/stat133/workout01/output/draymond-green-summary.txt")
summary(green)
sink()

sink("/Users/akhilperimbeti/Desktop/stat133/workout01/output/kevin-durant-summary.txt")
summary(durant)
sink() 

sink("/Users/akhilperimbeti/Desktop/stat133/workout01/output/andre-iguodala-summary.txt")
summary(iguodala)
sink() 

shots_data <- rbind(iguodala, green, thompson, curry, durant)

write.csv(x = shots_data,file = "/Users/akhilperimbeti/Desktop/stat133/workout01/data/shots-data.csv")

sink("/Users/akhilperimbeti/Desktop/stat133/workout01/output/shots-data-summary.txt")
print(summary(shots_data))
sink()
