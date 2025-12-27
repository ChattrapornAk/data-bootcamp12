# import random function to random com_hand
import random
hands = ["rock", "paper", "scissors"]
# start function
def game_start():
    print("Welcome to RPS game!")
    user_name = input("Please enter your name: ")
    print(f"Hello, {user_name}. Let's start game!")
    
# create score variable
    c_score = 0
    u_score = 0

# for loop to create 3 round of game
    for i in range(3):
        print(f"Round {i+1}")

        # use while loop to check correct user_hand
        while True:
            user_hand = input("Please enter your hand: rock, paper or scissors: ").lower()
            if user_hand in hands:
                break
            else:
                print("Invalid input. Please enter only 'rock', 'paper', 'scissors'.")
        com_hand = random.choice(hands)
        print(f"computer choose: {com_hand}")

        # if function to decision condition
        if user_hand == com_hand:
            print("It's a tie!")
        elif (user_hand == "rock" and com_hand == "scissors") or \
                (user_hand == "paper" and com_hand == "rock") or \
                (user_hand == "scissors" and com_hand == "paper"):
                u_score += 1
                print("You win!")
        elif (com_hand == "rock" and user_hand == "scissors") or \
                (com_hand == "paper" and user_hand == "rock") or \
                (com_hand == "scissors" and user_hand == "paper"):
                c_score += 1
                print("Yon lose!")
        
# summary game score
    print("\n*** GAME OVER ***")
    print(f"Final Score: {user_name}: {u_score} | Computer: {c_score}")
    if u_score > c_score:
        print("Overall Winner: Congratulations, you won!")
    elif u_score < c_score:
        print("Overall Winner: The Computer won this game.")
    else:
        print("Overall Result: It's a draw!")

game_start()
Welcome to RPS game!
Please enter your name: somo
Hello, somo. Let's start game!
Round 1
Please enter your hand: rock, paper or scissors: rock
computer choose: paper
Yon lose!
Round 2
Please enter your hand: rock, paper or scissors: paper
computer choose: scissors
Yon lose!
Round 3
Please enter your hand: rock, paper or scissors: sc
Invalid input. Please enter only 'rock', 'paper', 'scissors'.
Please enter your hand: rock, paper or scissors: scissors
computer choose: paper
You win!

*** GAME OVER ***
Final Score: somo: 1 | Computer: 2
Overall Winner: The Computer won this game.
