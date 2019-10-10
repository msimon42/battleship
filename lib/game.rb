class Game
  attr_reader :human_player, :computer_player

  def initialize
    @human_player = Player.new
    @computer_player = Player.new(true)
  end

  def place_ships(cruiser_coordinates, sub_coordinates)
    @computer_player.place_ship(@computer_player.ships[:Cruiser])
    @computer_player.place_ship(@computer_player.ships[:Submarine])

    @human_player.place_ship(@human_player.ships[:Cruiser], cruiser_coordinates.split(" "))
    @human_player.place_ship(@human_player.ships[:Submarine], sub_coordinates.split(" "))
  end

  def start
    puts "WELCOME TO BATTLESHIP"
    puts '*' * 75
    puts "Press 'p' to play"
    input = gets.chomp
    if input == 'p'

    end
  end

  def display_board_human
    @human_player.board.render(true)
  end

  def display_board_computer
    @computer_player.board.render
  end
end
