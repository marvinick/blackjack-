# Blackjack Game.

# Rules & Requirements: 
# Blackjack is a card game where you calculate the sum of the values of your cards and try to hit 21, 
#aka "blackjack". Both the player and dealer are dealt two cards to start the game. All face cards are worth whatever numerical value they show. 
#Suit cards are worth 10. Aces can be worth either 11 or 1. Example: if you have a Jack and an Ace, then you have hit "blackjack", 
# as it adds up to 21.

# After being dealt the initial 2 cards, the player goes first and can choose to either "hit" or "stay". Hitting means deal another card. 
# If the player's cards sum up to be greater than 21, the player has "busted" and lost. If the sum is 21, then the player wins. 
# If the sum is less than 21, then the player can choose to "hit" or "stay" again. If the player "hits", then repeat above, 
# but if the player stays, then the player's total value is saved, and the turn moves to the dealer.
# By rule, the dealer must hit until she has at least 17. If the dealer busts, then the player wins. If the dealer, hits 21, then the dealer wins. 
# If, however, the dealer stays, then we compare the sums of the two hands between the player and dealer; higher value wins.

# Hints:
# 1. Think of the data structure required to keep track of cards in a deck. 
# 2. You'll need to look up and use a "while" loop, since there could be an indeterminate number of "hits" by both the player and dealer. 
# "while" loops are used when we don't have a finite number of iterations.
# 3. Code something. Get started, even if it's just capturing the player's name. Give it an honest attempt before looking at solutions.
# 4. Use methods to extract the piece of functionality that calculates the total, since we need it throughout the program.

# Bonus:
# 1. Save the player's name, and use it throughout the app.
# 2. Ask the player if he wants to play again, rather than just exiting.
# 3. Save not just the card value, but also the suit. 
# 4. Use multiple decks to prevent against card counting players.

def calculate_total(cards)
  arr = cards.map{|e| e[1]}
  
  total = 0 
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10 
    else 
      total += value.to_i
    end 
  end 
  
  # Modified the Ace value 
  arr.select{|e| e = "A"}.count.times do 
    total -= 10 if total > 21 
  end 
  
  total 
end 

puts "What's your name?"
player = gets.chomp.upcase

puts "Welcome to the world of Blackjack, #{player}!"

suits = ['H','D','S','C']
cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

deck = suits.product(cards)
deck.shuffle!

# Deal Cards 

playercards =[]
dealercards = []

playercards << deck.pop 
dealercards << deck.pop 
playercards << deck.pop 
dealercards << deck.pop 

dealertotal = calculate_total(dealercards)
playertotal = calculate_total(playercards)

# Show Cards 

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of: #{dealertotal}"
puts "And you,#{player},have: #{playercards[0]} and #{playercards[1]}, for a total of: #{playertotal}"
puts ""

# Player's turn 
if playertotal == 21 
  puts "Congratulations, you hit the blackjack! You win!"
  exit
end 
 
while playertotal < 21 
  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp
  
  if !['1','2'].include?(hit_or_stay)
    puts "You can only enter 1 or 2"
    next
  end 
  
  if hit_or_stay == "2"
    puts "Allright, let's roll"
    break
  end 
  
  #if the player chooses hit 
  new_card = deck.pop 
  puts "Dealing card to player: #{new_card}"
  mycards << new_card 
  mytotal = calculate_total(mycards)
  puts "Your total is now: @{playertotal}"
  
  if playertotal == 21 
    puts "Congratulations, you hit blackjack! You win!"
    exit 
  elsif playertotal > 21 
    puts "Sorry, you're over 21. Busted!"
    exit
  end 
end 

#Dealer's turn 

if dealertotal == 21 
  puts "Sorry, dealer beat you to it. You lose"
  exit 
end 

while dealertotal < 17 
  #hit 
  new_card = deck.pop 
  puts "Dealing new card for dealer: #{new_card}"
  dealercards << new_card 
  dealertotal = calculate_total(dealercards)
  puts "Dealer total is now: #{dealertotal}"
  
  if dealertotal == 21 
    puts "Sorry, dealer hit blackjack. You lose."
    exit 
  elsif dealertotal > 21 
    puts "Congratulations, dealer busted! You win the game!"
    exit 
  end 
end 

#Compare hands 

puts "Dealer's cards: "
dealercards.each do |card|
  puts "=> #{card}"
end 
puts ""

puts "Your cards: "
mycards.each do |card|
  puts "=> #{card}"
end 
puts ""

if dealertotal > playertotal 
  puts "Dealer wins"
elsif playertotal > dealertotal
  puts "Congrats, you win the game!"
else 
  puts "It's a tie"
end 
  
exit 






    
    
    





