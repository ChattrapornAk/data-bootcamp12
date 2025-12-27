# menu items lists
dough <- c("classic", "thin")
flavor <- c("pepperoni", "bbq_chicken", "veggie_delight")
topping <- c("mushroom", "cheese", "chicken")
drinks <- c("cocacola", "water", "tea")
dessert <- c("tiramisu", "icecream", "lava_cake")
# price lists
dough_price <- c("classic" = 10, "thin" = 10)
flavor_price <- c("pepperoni" = 14, "bbq_chicken" = 15, "veggie_delight" = 13)
topping_price <- c("mushroom" = 1.5, "cheese" = 1.5, "chicken" = 1.5)
drinks_price <- c("cocacola" = 2.5, "water" = 2, "tea" = 3)
dessert_price <- c("tiramisu" = 5.5, "icecream" = 6, "lava_cake" = 4)

# start function pizza_restaurant
pizza_restaurant <- function() {
  bill <- 0 # set start bill = 0
  
  # get basic info & order by readline
  customer_name <- readline("Welcome to Pizza Paradise!, please give me your name: ")
  pizza_num <- as.numeric(readline("How many pizza do you want to order?(only number): "))
  # use is.na to recheck numeric if NA or < 1 can not continue next step
  if (is.na(pizza_num) | pizza_num < 1) {
        print("Warning: Invalid number of pizza. Order be cancelled.")
        pizza_num <- 0
      }
  pizza_counter <- 1
  
  # use while to run when all detail of pizza
  while (pizza_num > 0) {
    dough_order <- tolower(readline("Dough: Classic or Thin: "))
    flavor_order <- tolower(readline("Flavor (pepperoni, bbq_chicken, veggie_delight): "))
    print( paste("--Ordering Pizza#", pizza_counter,":" , dough_order, ",", flavor_order))
    pizza_cost <- 0
    
    # use if to check input names correctly with data in price
    if (dough_order %in% names(dough_price)) {
      pizza_cost <- pizza_cost + dough_price[dough_order]
    } else {
      print("Warning: Invalid dough. Using 'classic'.")
      pizza_cost <- pizza_cost + dough_price["classic"]
    }
    if (flavor_order %in% names(flavor_price)) {
      pizza_cost <- pizza_cost + flavor_price[flavor_order]
    } else {
      print( paste("Error!:", flavor_order, "Skipping this pizza."))
      pizza_num <- pizza_num -1 
      pizza_counter <- pizza_counter +1 
      next # use next to start next loop if condition not complete
    }
    
    # topping order using if for ask condition then using while loop to get input
    topping_add <- tolower(readline("Would you like to add any extra toppings? (y/n): "))
    if (topping_add == "y") {
      topping_num <- as.numeric(readline("How many topping do you want?(only number): "))
      if (is.na(topping_num) | topping_num < 1) {
        print("Warning: Invalid number of toppings. Setting topping to none.")
        topping_num <- 0
      }
      topping_counter <- 1
      while (topping_num > 0) {
        topping_order <- readline("Topping (mushroom, cheese, chicken): ")
        print( paste("--Topping added: ", topping_counter, topping_order))
        if (topping_order %in% names(topping_price)) {
          pizza_cost <- pizza_cost + topping_price[topping_order]
        } else {
          print( paste("Error!:", topping_order, "Skipping this topping."))
          topping_num <- topping_num -1
          topping_counter <- topping_counter +1
        }
        topping_num <- topping_num -1 # decrease every num to stop loop if num = input
        topping_counter <- topping_counter +1 # use to add number of each order
      }
    }
    bill <- bill + pizza_cost
    pizza_num <- pizza_num -1
    print( paste("--Pizza:Total cost:", round(bill,2))) # accumulate cost of all pizza
    pizza_counter <- pizza_counter +1
  }
  # add order drinks use the same syntax as above
  drinks_add <- tolower(readline("Anythings else? Do you want some drinks? (y/n): "))
  if (drinks_add == "y") {
    drinks_num <- as.numeric(readline("How many?(only number): "))
    if (is.na(drinks_num) | drinks_num < 1) {
      print("Warning: Invalid number of drinks. Setting drinks to none.")
      drinks_num <- 0
    }
    drinks_counter <- 1
    drinks_cost <- 0
    while (drinks_num > 0) {
      drinks_order <- tolower(readline("Drinks (cocacola, water, tea): "))
      if (drinks_order %in% names(drinks_price)) {
        drinks_cost <- drinks_cost + drinks_price[drinks_order]
      } else {
        print( paste("Error!:", drinks_order, "Skipping this drinks."))
        drinks_num <- drinks_num -1
        drinks_counter <- drinks_counter +1
      }
      drinks_num <- drinks_num -1
      drinks_counter <- drinks_counter +1
    } 
  }
  print( paste("Drinks cost:", round(drinks_cost,2)))
  drinks_counter <- drinks_counter +1
  # add order dessert
  dessert_add <- tolower(readline("Do you want some dessert? (y/n): "))
  if (dessert_add == "y") {
    dessert_num <- as.numeric(readline("How many?(only number): "))
    if (is.na(dessert_num) | dessert_num < 1) {
      print("Warning: Invalid number of dessert. Setting dessert to none.")
      dessert_num <- 0
    }
    dessert_counter <- 1
    dessert_cost <- 0
    while (dessert_num > 0) {
      dessert_order <- tolower(readline("Dessert (tiramisu, icecream, lava_cake): "))
      if (dessert_order %in% names(dessert_price)) {
        dessert_cost <- dessert_cost + dessert_price[dessert_order]
      } else {
        print( paste("Error!:", dessert_order, "Skipping this dessert."))
        dessert_num <- dessert_num -1
        dessert_counter <- dessert_counter +1
      }
      dessert_num <- dessert_num -1
      dessert_counter <- dessert_counter +1
    } 
  }
  print( paste("Dessert cost:", round(dessert_cost,2)))
  dessert_counter <- dessert_counter +1
  bill <- bill + drinks_cost + dessert_cost
  print("---Total bills---")
  print( paste0("$", bill))
  print("Thank you! We hope you enjoyed your meal.")

