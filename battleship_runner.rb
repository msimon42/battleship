require_relative 'lib/game'

game = Game.new

loop do
  input = game.main_menu
  break if input == 'q'
  game.start
  game.play_game
  game.end_game
 end

puts "Goodbye!"