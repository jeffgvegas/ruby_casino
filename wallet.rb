class Wallet
require "colorize"
	attr_accessor :balance
	def initialize
		self.balance = 100.to_f
	end

	def print
		puts "Wallet :" + " $".green + "#{'%.2f' % balance}"
  end
end
