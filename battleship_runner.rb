require_relative 'lib/game'

loop do
  game = Game.new
  input = game.main_menu
  break if input == 'q'
  next if input != 'p'
  game.start
  game.play_game
  game.end_game
 end

puts "Goodbye!"