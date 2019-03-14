getwd()

library(ggplot2)
library(grid)
install.packages("jpeg")
library(jpeg)

help(rasterGrob)

court_file <- "/Users/akhilperimbeti/Desktop/stat133/workout01/images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

thompson_shot_chart <- 
  ggplot(thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()

green_shot_chart <-
  ggplot(green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()

iguodala_shot_chart <-
  ggplot(iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()

durant_shot_chart <-
  ggplot(durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()

curry_shot_chart <-
  ggplot(curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()


getwd()

iguodala_shot_chart
ggsave(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)

curry_shot_chart
ggsave(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
png(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/stephen-curry-shot-chart.png", width = 8, height = 7, units = "in", res = 100)
curry_shot_chart

green_shot_chart
ggsave(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)

thompson_shot_chart
ggsave(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)

durant_shot_chart
ggsave(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
png(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/kevin-durant-shot-chart.png", width = 8, height = 7, units = "in", res = 100)
durant_shot_chart

gsw_players <- rbind.data.frame(curry, durant, iguodala, green, thompson)

gsw_shot_charts <- 
  ggplot(gsw_players) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  theme_minimal() +
  facet_wrap( ~ player_name) +
  labs(title = "Shot Charts (GSW) : 2016 Season")
 
gsw_shot_charts
ggsave(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/gsw-shot-charts.pdf", width = 8, height = 7)

png(file = "/Users/akhilperimbeti/Desktop/stat133/workout01/images/gsw-shot-charts.png", width = 8, height = 7, units = "in", res = 100)
gsw_shot_charts
dev.off()