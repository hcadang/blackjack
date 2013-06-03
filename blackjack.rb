require 'pry'

# Interactive command line blackjack game
# gotealeaf.com

# def(ine) is a method -- method is a reusable section 
# of code written to perform a specific task in a program.
# def some_name
#   code
# end
def calculate_total(cards) 
  # [['H', '3'], ['S', 'Q'], ... ]
  arr = cards.map{|e| e[1] }
  # map will give you a new array with second element

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

puts "Welcome to Blackjack!"
puts ""


suits = ['C', 'S', 'H', 'D']
# C = clubs, S = Spades, H = Hearts, D = Diamonds
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
# This will distribute the suits into the cards for example C2..CA, S2..SA, H2..HA, D2..DA
deck.shuffle!
# shuffle! will shuffle elements in self place


# why did you initiate as an empty array????
playercards = []
dealercards = []

playercards << deck.pop
dealercards << deck.pop
playercards << deck.pop
dealercards << deck.pop
# << deck.pop will start dealing out the cards
# pop removes the last element from self and returns it, or nil if the array is empty

dealertotal = calculate_total(dealercards)
playertotal = calculate_total(playercards)


# puts below will show cards
puts "Player's first card is #{playercards[0]}"
puts ""
puts "Dealer's first card is #{dealercards[0]}"
puts ""
puts "Player's second card is #{playercards[1]}"
puts ""
puts "Dealer's second card is #{dealercards[1]}"
puts ""
puts "Player has #{playertotal}"
puts ""
puts "Dealer has #{dealertotal}"
puts ""
# "" adds an empty line
#binding.pry

# Player first to act
if playertotal == 21
  puts "Awesome!!! Player has BLACKJACK! Easy money! LOL"
  exit
end

# while loop
while playertotal < 21
  puts "Hit or stay? Type hit for more cards, Type stay"
  hit_or_stay = gets.chomp

# ! will turn the array false?????
# why is this not on dealer too?
  if !['hit', 'stay'].include?(hit_or_stay)
    puts "Error: you must enter hit or stay"
    next
    # next means go to next loop after this execuation
  end

  if hit_or_stay == "stay"
    puts "Player has #{playertotal}"
    break
    # break is breaking the loop
  end

# hit
  new_card = deck.pop
  puts "Player hits... #{new_card}"
  playercards << new_card
  playertotal = calculate_total(playercards)
  puts "Player has #{playertotal}"

  if playertotal > 21
    puts "Busted!!!"
    exit
  end
end

# Dealer acts last
if dealertotal == 21
  puts "Dealer has blackjack. You lose."
  exit
end

while dealertotal < 17
  # dealer hits
  new_card = deck.pop
  puts "Dealer hits... #{new_card}"
  dealercards << new_card
  dealertotal = calculate_total(dealercards)
  puts "Dealer has #{dealertotal}"

  if dealertotal > 21
    puts "Dealer busted!!! Easy money!!!!"
    exit
  end
end

# Compare hands

puts "Dealer has...  "
  dealercards.each do |card|
    puts "=> #{card}"
  end
puts ""

puts "Player has... "
  playercards.each do |card|
    puts "=> #{card}"
  end
puts ""  

if dealertotal > playertotal
  puts "Dealer wins!"
elsif dealertotal < playertotal
  puts "Winner winner chicken dinner!!!"
else
  puts "Player pushes..."
end

exit
  



