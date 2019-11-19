# Christie Finnie
# Jeffery Gontarek
require "./cards"
require "./slots"
require "./wallet"
require "colorize"

wallet = Wallet.new
game_playing = true
while game_playing
puts "                     Welcome to the Ruby Casino!".yellow
`say   "Welcome to the Ruby Casino Lobby"`
puts "                    Which game do you want to play?"
`say   "Which game do you want to play?"`
puts "                               1. Slots".light_blue
`say    "  Choose 1 for slots"`
puts "                               2. High / Low".white
`say    "  Choose 2 for High Low"`
puts "                               Q. Quit".light_red
`say    "Type Q to quit"`
puts "=".yellow*50
game_select = gets.chomp

case game_select.upcase
when "1"
	game = Slots.new
	game.start_game(wallet)
when "2"
	game = Cards.new
	game.start_game(wallet)
when "Q"
	puts "Thank you for playing at THE RUBY CASINO!".red
` say     "Thank you for playing at THE RUBY CASINO!"`
`say "Good Bye"`
	game_playing = false
end
	game_select = ""
end
