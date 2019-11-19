class Slots
	require "colorize"
	require "./wallet"
	def initialize 
		 @symbols = %w(🤣 😇 😋 😝)
	end

	def start_game(wallet)

puts "               🤣 😇 😋 😝  Welcome to Emoji Slots  😝 😋 😇 🤣"
            ` say "Welcome to Emoji Slots"`
puts "                          3 of the same symbol wins".magenta
`say "Get 3 of the same emojis in a row and you Win"`
puts "                             ( all else loses )"
puts "                               😝😝😝😝😝😝😝"


game_playing = true

while game_playing


puts "=".yellow*50
puts "GOOD LUCK!".blue
`say "Good Luck"`
puts "=".yellow*50

puts "Wallet :" + " $".green + "#{'%.2f' % wallet.balance}"
`say "Here is your wallet"`
puts "How much would you like to bet?"
`say "How much would you like to bet?"`

bet_amount = gets.chomp

if bet_amount.upcase == "Q"


   puts "Exiting game.".red
`say "Thank you for playing Emoji Slots. Good Bye!"`
   game_playing = false
   next
elsif not bet_amount =~ /^\d+\.*\d*$/
   puts "Invalid".red + " bet amount."
`say "I'm sorry but that is an invald bet. Please place a valid bet."` 
    next
end
puts "Bet Amount:" + " $".green + "#{'%.2f' % bet_amount}"
if bet_amount.to_i > wallet.balance 
	puts "Insufficient funds.".red + " Place a lower bet."
`say "You dont have enough money. Please place a lower bet"`
	puts "When the Fun Stops...".yellow
	puts "We Can Help!".yellow
	puts "Call the Problem Gamblers HelpLine:".yellow
	puts "1-800 -522-4700".light_red
	next
end

first = @symbols.sample
second = @symbols.sample
third = @symbols.sample

puts "#{first} #{second} #{third}"

if first == second && second == third
	puts "You win".green
`say "Your a winner"`
	wallet.balance += bet_amount.to_i
	puts "You won" + " $".green + "#{'%.2f' % bet_amount}!"
else
	puts "You lose".red
`say " Im sorry but you lost better luck next time"`
	wallet.balance -= bet_amount.to_i
end

wallet.print

end
	end
end


