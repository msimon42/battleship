
require_relative 'player'
require_relative 'turn'

class Game
  attr_reader :human_player, :computer_player, :winner

  def initialize
    @human_player = Player.new
    @computer_player = Player.new(true)
    @winner = nil
  end

  def place_computer_ships
    @computer_player.place_ship(@computer_player.ships[:Cruiser])
    @computer_player.place_ship(@computer_player.ships[:Submarine])

    # @human_player.place_ship(@human_player.ships[:Cruiser], cruiser_coordinates.tr(",", "").split(" "))
    # @human_player.place_ship(@human_player.ships[:Submarine], sub_coordinates.tr(",", "").split(" "))
  end

  def ask_for_ship_coordinates(ship)
    loop do
      puts "Enter the coordinates for your #{ship.name}: "
      ship_coordinates = gets.chomp
      unless @human_player.board.valid_placement?(@human_player.ships[ship.name.capitalize.to_sym], ship_coordinates.tr(",", "").split(" "))
         puts "The coordinates for your #{ship.name} are invalid. Please try again"
          next
      end
      return ship_coordinates
    end
  end

  def render_boards
    puts '=============HUMAN BOARD=============='
    puts @human_player.board.render(true)
    puts ''
    puts '============COMPUTER BOARD============'
    puts @computer_player.board.render
    puts ''
  end

  def turn_loop
    until @human_player.ships_sunk? || @computer_player.ships_sunk?
      human_guess = @human_player.guess
      computer_guess = @computer_player.guess
      turn = Turn.new(computer_guess, human_guess, self.computer_player, self.human_player)
      puts turn.human_fire_shot
      puts turn.computer_fire_shot
      self.render_boards
    end
  end

  def play_game
    puts "Let's Begin!"
    self.render_boards
    self.turn_loop
    if @human_player.ships_sunk?
      @winner = @computer_player
    elsif @computer_player.ships_sunk?
      @winner = @human_player
    end
  end

  def end_game
    if @winner == @computer_player
      puts @computer_player.speak(:computer_won)
    elsif @winner == @human_player
      puts @computer_player.speak(:computer_lost)
    else
      puts 'Nobody won..?'
    end
  end

  def main_menu
    puts "WELCOME TO BATTLESHIP"
    puts '*' * 75
    puts "Press 'p' to play"
    puts "Press 'q' to quit"
    input = gets.chomp
  end

  def start
    self.place_computer_ships
    puts self.computer_player.speak(:beginning)
    puts @human_player.board.render(true)
    cruiser_coordinates = self.ask_for_ship_coordinates(@human_player.ships[:Cruiser])
    @human_player.place_ship(@human_player.ships[:Cruiser], cruiser_coordinates.tr(",", "").split(" "))
    puts @human_player.board.render(true)
    sub_coordinates = self.ask_for_ship_coordinates(@human_player.ships[:Submarine])
    @human_player.place_ship(@human_player.ships[:Submarine], sub_coordinates.tr(",", "").split(" "))
  end

  def display_board_human
    @human_player.board.render(true)
  end

  def display_board_computer
    @computer_player.board.render
  end
end

# game = Game.new
# puts game.start
# puts game.play_game