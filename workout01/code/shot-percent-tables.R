library(dplyr)
data_gsw <- select(shots_data, player_name, shot_type, shot_made_flag)

#For all the 2PT shots made and total 2PT shots attempted
iguodala_2pt <- data_gsw %>% filter(player_name == "Andre Iguodala") %>% filter(shot_type == "2PT Field Goal") %>% filter(shot_made_flag == "shot_yes")
curry_2pt <- data_gsw %>% filter(player_name =="Stephen Curry") %>% filter(shot_type == "2PT Field Goal") %>% filter(shot_made_flag == "shot_yes")
thompson_2pt <- data_gsw %>% filter(player_name == "Klay Thompson") %>% filter(shot_type == "2PT Field Goal") %>% filter(shot_made_flag == "shot_yes")
green_2pt <- data_gsw %>% filter(player_name == "Draymond Green") %>% filter(shot_type == "2PT Field Goal") %>% filter(shot_made_flag == "shot_yes")
durant_2pt <- data_gsw %>% filter(player_name == "Kevin Durant") %>% filter(shot_type == "2PT Field Goal") %>% filter(shot_made_flag == "shot_yes")

iguodala_2pt_total <- data_gsw %>% filter(player_name == "Andre Iguodala") %>% filter(shot_type == "2PT Field Goal")
curry_2pt_total <- data_gsw %>% filter(player_name == "Stephen Curry") %>% filter(shot_type == "2PT Field Goal")
thompson_2pt_total <- data_gsw %>% filter(player_name == "Klay Thompson") %>% filter(shot_type == "2PT Field Goal")
green_2pt_total <- data_gsw %>% filter(player_name == "Draymond Green") %>% filter(shot_type == "2PT Field Goal")
durant_2pt_total <- data_gsw %>% filter(player_name == "Kevin Durant") %>% filter(shot_type == "2PT Field Goal")

iguodala_num <- length(iguodala_2pt$shot_made_flag)
curry_num <- length(curry_2pt$shot_made_flag)
thompson_num <- length(thompson_2pt$shot_made_flag)
durant_num<- length(durant_2pt$shot_made_flag)
green_num <- length(green_2pt$shot_made_flag)

total_a <- length(iguodala_2pt_total$shot_made_flag)
total_b <- length(curry_2pt_total$shot_made_flag)
total_c <- length(thompson_2pt_total$shot_made_flag)
total_d <- length(durant_2pt_total$shot_made_flag)
total_e <- length(green_2pt_total$shot_made_flag)

made <- rbind(iguodala_num, curry_num, thompson_num, durant_num,green_num)
total <- rbind(total_a, total_b, total_c, total_d, total_e)
percent_made <- made/total*100

#For all the 3PT shots made and total 3PT shots attempted
shots3_andre <- data_gsw %>% filter(player_name == "Andre Iguodala") %>% filter(shot_type == "3PT Field Goal") %>% filter(shot_made_flag == "shot_yes")
shots3_curry <- data_gsw %>% filter(player_name =="Stephen Curry") %>% filter(shot_type == "3PT Field Goal") %>% filter(shot_made_flag == "shot_yes")
shots3_klay <- data_gsw %>% filter(player_name == "Klay Thompson") %>% filter(shot_type == "3PT Field Goal") %>% filter(shot_made_flag == "shot_yes")
shots3_draymond <- data_gsw %>% filter(player_name == "Draymond Green") %>% filter(shot_type == "3PT Field Goal") %>% filter(shot_made_flag == "shot_yes")
shots3_kevin <- data_gsw %>% filter(player_name == "Kevin Durant") %>% filter(shot_type == "3PT Field Goal") %>% filter(shot_made_flag == "shot_yes")

total3_andre <- data_gsw %>% filter(player_name == "Andre Iguodala") %>% filter(shot_type == "3PT Field Goal")
total3_curry <- data_gsw %>% filter(player_name == "Stephen Curry") %>% filter(shot_type == "3PT Field Goal")
total3_klay <- data_gsw %>% filter(player_name == "Klay Thompson") %>% filter(shot_type == "3PT Field Goal")
total3_draymond <- data_gsw %>% filter(player_name == "Draymond Green") %>% filter(shot_type == "3PT Field Goal")
total3_kevin <- data_gsw %>% filter(player_name == "Kevin Durant") %>% filter(shot_type == "3PT Field Goal")

dim(filter(curry, shot_type == "3PT Field Goal"))[1]

f <- length(shots3_andre$shot_made_flag)
g <- length(shots3_curry$shot_made_flag)
h <- length(shots3_klay$shot_made_flag)
i <- length(shots3_kevin$shot_made_flag)
j <- length(shots3_draymond$shot_made_flag)

total_f <- length(total3_andre$shot_made_flag)
total_g <- length(total3_curry$shot_made_flag)
total_h <- length(total3_klay$shot_made_flag)
total_i <- length(total3_kevin$shot_made_flag)
total_j <- length(total3_draymond$shot_made_flag)

made3 <- rbind(f, g, h, i, j)
total3 <- rbind(total_f, total_g, total_h, total_i, total_j)
percent_made3 <- made3/total3*100

Name <- c("Andre Iguodala", "Stephen Curry", "Klay Thompson", "Kevin Durant", "Draymond Green")

percent_3pt <- cbind.data.frame(Name, total3, made3, percent_made3)
percent_2pt <- cbind.data.frame(Name, total, made, percent_made)
percent_overall <- cbind.data.frame(Name, total3+total, made3+made, (made3+made)/(total3+total)*100)

colnames(percent_2pt) <- c("Name", "Total", "Made", "Percent_Made")
colnames(percent_3pt) <- c("Name", "Total", "Made", "Percent_Made")
colnames(percent_overall) <- c("Name", "Total", "Made", "Percent_Made")

percent_3pt <- arrange(percent_3pt, desc(Percent_Made))
percent_2pt <- arrange(percent_2pt, desc(Percent_Made))
percent_overall <- arrange(percent_overall, desc(Percent_Made))

write.csv(percent_2pt,
          file = "/Users/akhilperimbeti/Desktop/stat133/workout01/data/percent_of_2PT.csv")

write.csv(percent_3pt,
          file = "/Users/akhilperimbeti/Desktop/stat133/workout01/data/percent_of_3PT.csv")

write.csv(percent_overall,
          file = "/Users/akhilperimbeti/Desktop/stat133/workout01/data/total_overall_percent.csv")