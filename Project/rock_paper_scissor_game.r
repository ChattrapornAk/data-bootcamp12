# create object of hand
hand <- c("rock", "paper", "scissors")
# set target score of game
t_score <- 3
# create function play_game()
play_game <- function() {
  p_score <- 0 # set start score of playper
  c_score <- 0 # set start score of computer
  # get input player_name by readline function
  player_name <- readline("Welcome to R-P-S game!, Tell me your name: ")
  print( paste("Let's start the game", player_name))
  # use while loop to run condition
  # use readline to get input of player_hand
  # use sample to random computer hand
  while (p_score < t_score & c_score < t_score) {
    player_hand <- tolower(readline("Choose your hand: rock, paper, scissors: "))
    # use %in% in operator to combine value in hand, ! -> that invalid input
    if (!player_hand %in% hand) {
      print("Invalid input. Please choose 'rock', 'paper', or 'scissors'.")
      next
    }
    com_hand <- sample(hand, 1)
    print( paste("player hand is", player_hand, ", computer hand is", com_hand))
    if (player_hand == com_hand) {
      print( paste("You're draw!", player_name, "'s score is:", p_score, "Computer score is:", c_score))
    } else if (
      (player_hand == "rock" & com_hand == "scissors")|
      (player_hand == "paper" & com_hand == "rock")|
      (player_hand == "scissors" & com_hand == "paper")
    ) {
      p_score <- p_score +1
      print( paste("You're wins!", player_name, "'s score is:", p_score, "Computer score is:", c_score))
    } else {
      c_score <- c_score +1
      print( paste("You're loses!", player_name, "'s score is:", p_score, "Computer score is:", c_score))
    }
  }
  # print summary score after while loop
  # use if else to print result of game
  print( paste("Summary score. You:", p_score))
  if (p_score == t_score) {
    print( paste("Congratulation! You're the Winner.", player_name))
  } else if (c_score == t_score) {
    print("Sorry, you lost this time. Better luck next round!")
  }
}
