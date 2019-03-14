#akhil-perimbeti-workout01

**team_name**: Holds the team name. GSW for all data provided.

**game_date**: the month/day/year that the game took place. The data is composed of character objects.

**season**: The NBA season during which the statistics are collected (2016-2017)

**period**: The period of the game when the shot was taken. Holds numbers 1-4 referring to the four periods of the game, such as 1 representing the first period.

**minutes_remaining**: the amount of minutes left in the period after the shot was taken. Each period has 12 minutes, so the values range from 0-11, such as 3 refers to 3 minutes left in the game after shot was taken.

**seconds_remaining**: the amount of seconds left in the period after the shot was taken in accordance with the variable minutes_remaining. Each minute has 60 minutes, so the values range from 0-59, such as 30 refers to 30 seconds plus the minutes_remaining left in the game after shot was taken.

**shot_made_flag**: shows whether an attempted shot was made or not. shot_yes = attemopted shot made and point and shot_no = no point made

**action_type**: this refers to the basketball moves by each player while making the shot. Such as lay-up, assists etc

**shot_type**: whether the shot was within the 2-point area, or the 3-point area. 

**shot_distance**: the distance from which net from which the shot was taken, ranging from 0-71(size of court), with the number 31 referring that the shot was made 31 feet from the net.

**opponent**: The name of the opposing team for each game.

**x**: this indicates where on the x axis(coordinates) trhe shot was taken on an NBA court. 

**y**: this indicates where on the y axis(coordinates) trhe shot was taken on an NBA court.

**player_name**:The name of the player who has taken the shot. We are opnly looking at data from 5 players on GSW: Curry, Durant, Green, Iguodala and Thompson

**minute**: this indicates the minute in the game during which the shot was taken. The way we find this value is : (12)*("period") - ("minutes_remaining"), where 12 minutes are multiplied by the period to see how many minutes have passed and subtract the minutes remaining to find the specific minute when the shot was taken.

