#create menu by dictionary
pizza_menu = {
    # Key: Category Name
    # Value: A sub-dictionary of Item: Price
    "crusts": {
        "thick": 120,   # Key: Item Name, Value: Price
        "thin": 100
    },

    "main toppings": {
        "seafood": 250,
        "hawaiian": 200,
        "meat lover": 280
    },

    "extra toppings": {
        "extra cheese": 50,
        "mushroom": 30,
        "bacon": 40
    }
}

# create function to order pizza
def pizza_restaurant():
    print("Welcome to the Pizza Restaurant!")
    user_name = input("Please enter your name: ")
    print(f"Hello, {user_name}! Let's order a pizza.")

    # use while loop to check invalid integer until enter valid integer
    while True: # while#1
        pizza_quantity = int(input("How many pizzas do you want to order?: "))
        if pizza_quantity > 0:
            break # if true run to 'for loop in pizza quantity'
        else: # if flase cont. while#1 loop
            print("Please enter a valid quantity.")
    
    # setting start of bill and list of order before start loop
    total_bill = 0             
    all_ordered_crusts = []    
    all_ordered_mains = []     
    all_final_toppings = [] 
    # then use for loop to order pizza as integer above
    for i in range(pizza_quantity):
        print(f"pizza# {i+1}")
        print("-"*40)
        
        # first: ask crust
        while True: # while#2
            crust_input = input("Please choose your crusts (thick/thin): ").lower()
            # use ifelse to check invalid value of crust
            if crust_input in pizza_menu["crusts"]:
                crust_price = pizza_menu["crusts"][crust_input]
                print(f"You have chosen {crust_input}: {crust_price} baht.")
                break # if true run to 'second'
            else: # if false cont while#2 loop
                print("Invalid crust choice.")

        # second: ask main toppings
        while True: # while#3
            maintop_input = input("Please choose your main toppings (seafood/hawaiian/meat lover): ").lower()
            # use ifelse to check invalid value of main topping
            if maintop_input in pizza_menu["main toppings"]:
                maintop_price = pizza_menu["main toppings"][maintop_input]
                print(f"You have chosen {maintop_input}: {maintop_price} baht.")
                break # if true run to 'third'
            else: # if false cont while#3 loop
                print("Invalid main topping choice.")

        # third: ask extra toppings
        # condition1: add or not
        # condition2: if added -> how many and loop in add toppings
        all_topping = []
        topping_total = 0
        while True: # while#4 to check condition y/n added
            topping_add = input("Do you want any toppings? Y/N: ")
            # condition1
            if topping_add.upper() == "Y": # if true run to condition2 while#5
                #use while loop to check invalid integer
                while True: # use while#5 loop to check int
                    # condition2
                    # how many
                    topping_quantity = int(input("How many toppings do you want to add?: "))
                    if topping_quantity > 0:
                        break # if true break this loop run 'for in topping quantity'
                    else: # if false cont while#5 loop
                        print("Please enter a valid quantity.")

                # loop in toppping quantity
                for j in range(topping_quantity):
                    while True: # use while#6 loop to check invalid topping input
                        topping_input = input("Please choose your extra toppings (extra cheese/mushroom/bacon): ").lower()
                        # use ifelse to check invalid value of extra topping
                        if topping_input in pizza_menu["extra toppings"]:
                            topping_price = pizza_menu["extra toppings"][topping_input]
                            topping_total += topping_price
                            all_topping.append(topping_input)
                            print(f"You have added {topping_input}: {topping_price} baht.")
                            break # if true break this loop run 'for in summary price'
                        else: # if false cont while#6 loop
                            print("Invalid extra topping choice.")
                break # break while#4 after finish for loop

            elif topping_add.upper() == "N":
                break # if true break condition1 run 'for in summary price'
            else: # if false not Y/N cont while#4
                print("Invalid choice. Please enter Y or N.")

        # accumulation price and add list after all loop above but in 1st for loop
        total_bill += (crust_price + maintop_price + topping_total) 
        all_ordered_crusts.append(crust_input)
        all_ordered_mains.append(maintop_input)
        all_final_toppings.extend(all_topping) # extend list to show
    
    # summary order
    print("\n" + "="*40)
    print("--- TOTAL ORDER SUMMARY ---")
    print(f"Total Pizzas: {pizza_quantity}")
    print(f"All Crusts: {', '.join(all_ordered_crusts)}")
    print(f"All Main Toppings: {', '.join(all_ordered_mains)}")
    print(f"All Extra Toppings: {', '.join(all_final_toppings) if all_final_toppings else 'None'}")
    print(f"GRAND TOTAL: {total_bill} Baht")
    print("="*40)

pizza_restaurant()
