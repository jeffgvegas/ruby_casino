class Cards
	require "./wallet"
	def initialize 
		 @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
	end

	def start_game(wallet) 
puts"                             High".red + "  ||" + "  Low".blue
`say "Welcome to High Low "`
puts "Kings are High and Aces are Low"
`say "where kings are high and aces are low"` 


game_playing = true

while game_playing
dealers_card = @ranks.sample

puts "=".yellow*50
puts "GOOD LUCK".blue
puts "=".yellow*50
`say " Good Luck"`

wallet.print
puts "How much would you like to bet?".yellow + " Enter" + " (Q)".red + " to quit game."
`say "how much would you like to bet?"`

bet_amount = gets.chomp
if bet_amount.upcase == "Q"
	puts "Exiting game.".red
` say "Thank you for playing High low"`
	game_playing = false
	next
elsif not bet_amount =~ /^\d+\.*\d*$/
	puts "Invalid bet amount.".red
`say "Im sorry but that is not a valid bet"`
`say "please enter a valid bet"`
	next
end
puts "BET AMOUNT" + " $".green + "#{'%.2f' % bet_amount}"
bet_amount = bet_amount.to_f


if bet_amount > wallet.balance 
	puts "Insufficient funds.".red + " Place a lower bet."
`say "Im sorry but you dont have enough money to place that bet"`
`say "please place a lower bet"`
	next
end
`say "and the dealers card is"`
puts "Dealers Card:".yellow + " #{dealers_card}"
puts
guess_read = false
while not guess_read
puts "Will the next card be higher or lower [" + " H".red + " |" + " L".blue + " ]?"
`say "will the next card be higher or lower?"`
`say "h for high l for low"`
guess = gets.chomp
if guess.upcase == "H" || guess.upcase == "L"
	guess_read = true
else
`say "sorry but you must finish the hand"`
`say " please guess high or low"`
end 
end

next_card = @ranks.sample

`say " and the next card is"`
puts "Next Card:".yellow + " #{next_card}"

#puts "Index next card #{@ranks.index(next_card)}"
#puts "Index deal card #{@ranks.index(dealers_card)}"
result = ""
dealer_index = @ranks.index(dealers_card)
next_index = @ranks.index(next_card)
if dealer_index > next_index
		result = "L"
`say "lower"`
elsif dealer_index < next_index
		result = "H"
`say "higher"`
else
	result = "Tie"
`say "its a tie"`
end

if result == "Tie"
    puts "Tie"
elsif result.downcase == guess.downcase
	puts "You win".green
`say " your a winner"`
	wallet.balance += bet_amount
	puts "You won" + " $".green + "#{'%.2f' % bet_amount}!"
else
	puts "You lose".red
`say " im sorry you lost. better luck next time"`
	wallet.balance -= bet_amount
end

wallet.print

end
	end
end


