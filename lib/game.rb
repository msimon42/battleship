require 'pry'
require_relative 'player'
require_relative 'turn'

class Game
  attr_reader :human_player, :computer_player, :winner

  def initialize
    @human_player = Player.new
    @computer_player = Player.new(true)
    @winner = nil
  end

  def main_menu
    puts "WELCOME TO BATTLESHIP"
    puts '*' * 75
    puts "Press 'p' to play"
    puts "Press 'q' to quit"
    input = gets.chomp.downcase
  end

  def place_computer_ships
    @computer_player.place_ship(@computer_player.ships[:Cruiser])
    @computer_player.place_ship(@computer_player.ships[:Submarine])
  end

  def ask_for_ship_coordinates(ship)
    loop do
      puts "Enter the coordinates for your #{ship.name}: "
      ship_coordinates = gets.chomp.upcase
      unless @human_player.board.valid_placement?(@human_player.ships[ship.name.capitalize.to_sym], ship_coordinates.tr(",", "").split(" "))
         puts "The coordinates for your #{ship.name} are invalid. Please try again"
          next
      end
      return ship_coordinates
    end
  end

  def render_boards
    puts '=============YOUR BOARD=============='
    puts @human_player.board.render(true)
    puts ''
    puts '============COMPUTER BOARD============'
    puts @computer_player.board.render
    puts ''
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

  def turn_loop
    until @human_player.ships_sunk? || @computer_player.ships_sunk?
      human_guess = self.guess(@human_player)
      computer_guess = self.guess(@computer_player)
      turn = Turn.new(computer_guess, human_guess, self.computer_player, self.human_player)
      puts turn.human_fire_shot
      break if @computer_player.ships_sunk?
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

  def guess(player)
    if player == @computer_player
      loop do
        if @computer_player.hits.length == 1
          branch_cell = @computer_player.hits[0]
          possible_guesses = @human_player.board.find_all_adjacent_cells(branch_cell)
          guess = possible_guesses.sample
        elsif @computer_player.hits.length > 1
          case @human_player.board.adjacent?(@computer_player.hits.last(2))
          when 'row'
            possible_guesses = @computer_player.hits.last(2).flat_map {|hit| @human_player.board.find_adjacent_cells(hit, @human_player.board.rows)}
            guess = possible_guesses.sample
          when 'column'
            possible_guesses = @computer_player.hits.last(2).flat_map {|hit| @human_player.board.find_adjacent_cells(hit, @human_player.board.columns)}
            guess = possible_guesses.sample
          else
             guess = @human_player.board.cells.keys.sample
          end
        else
          guess = @human_player.board.cells.keys.sample
        end
        return guess if @human_player.board.valid_coordinate?(guess)
      end
    else
      loop do
        puts "Enter your guess: "
        guess = gets.chomp.upcase
        return guess if @computer_player.board.valid_coordinate?(guess)
        puts "Coordinate not found or has already been fired upon."
      end
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

end
