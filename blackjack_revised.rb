##revised blackjack



BLACKJACK = 21 #Constants
STAYS = 17 #Constants


def calculate_total(cards)
  count = cards.map{|e| e[0] }

  total = 0
  count.each do |key|
    if key == "A"
      total += 11
    elsif key.to_i == 0
      total += 10
    else
      total += key.to_i
    end
  end

  #correct for Aces
  count.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end
    total
end


def deck
  deck = key.product(value)
    #I went with key value so I can keep track of it easier 
    key = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    value = [' of Clubs', ' of Spades', ' of Hearts', ' of Diamonds']
end

def new_card
  new_card = deck.pop
end


def players_total
  players_total = calculate_total(players_cards)
end


def dealers_total
  dealers_total = calculate_total(dealers_cards)
end


puts "Welcome to blackjack!"
puts ""
puts ""


puts "Hello,  Please type in your name to play?"
name = gets.chomp
puts ""


puts "Welcome #{name}! Good luck!"


#shuffling cards
deck.shuffle!


#initializing players and dealers card with any empty array 
players_cards = []
dealers_cards = []


#dealing cards
players_cards << deck.pop
dealers_cards << deck.pop
players_cards << deck.pop
dealers_cards << deck.pop


puts "#{name}'s first card is #{players_cards[0]}"
puts ""
puts "Dealer's first card is faced down"
puts ""
puts "#{name}'s second card is #{players_cards[1]}"
puts ""
puts "Dealers's second card is #{dealers_cards[1]}"
puts ""
puts "#{name}'s total is #{players_total}"
puts ""
puts "Dealer's total is #{dealers_total}"


if players_total == BLACKJACK && dealers_total = BLACKJACK
  puts "#{name}, you have Blackjack, Dealer has Blackjack. #{name}, you push"  
elsif
  players_total == BLACKJACK
  puts "#{name}, you Blackjack!!! Winner winner chicken dinner!!!"
end


puts "Dealer is showing #{dealers_cards[1]}"


if players_total > BLACKJACK
  puts "#{name}, you have #{players_total}.  What would you like to do?  Please type hit or stay"
    case gets.chomp
      when "stay"
        puts "#{name} stays at #{players_total}."
      when "hit"
        
    end
  end