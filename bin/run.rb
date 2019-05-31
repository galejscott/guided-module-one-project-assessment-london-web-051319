require_relative '../config/environment'


puts "hello world"
binding.pry
cli = UserInterface.new

cli.welcome

