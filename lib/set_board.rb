require_relative "ships"

class SetBoard

  attr_reader :game_board

  def initialize(width = 10, height = 10, ships = [Ship.new(3), Ship.new(2)])
    @width = width
    @height = height
    @game_board = []
    @ships = ships
    @ship_number = 0
  end

  def create_board()
    @game_board = Array.new(@width) { Array.new(@height) }
  end

  def place_ship(x, y, direction)
    finish_placement? ? (puts "All ships placed" ; return) : nil
    # x and y are kept true to normal coordinates on a graph, 2D array is reversed
    @game_board = @game_board.reverse
    ship_length = @ships[@ship_number].size

    (boundary_check(x, y, direction, ship_length) &&
      overlap_check(x, y, direction, ship_length)) ? nil : (puts "Can not place ship there"; return)

    set_ship_variables(x, y, direction)

    if direction == "h"
      for n in 0...ship_length
        @game_board[y - 1][x - 1 + n] = "O"
      end
    elsif direction == "v"
      for n in 0...ship_length
        @game_board[y - 1 + n][x - 1] = "O"
      end
    end
    @ship_number += 1
    @game_board = @game_board.reverse
  end

  private

  def boundary_check(x, y, direction, ship_length)
    if direction == "h"
      return (x + ship_length) < @width
    elsif direction == "v"
      return (y + ship_length) < @height
    else
      false
    end
  end

  def overlap_check(x, y, direction, ship_length)
    if direction == "h"
      for n in 0...ship_length
        return @game_board[y - 1][x - 1 + n] != "O"
      end
    elsif direction == "v"
      for n in 0...ship_length
        return @game_board[y - 1 + n][x - 1] != "O"
      end
    else
      false
    end
  end

  def finish_placement?
    @ships.length <= @ship_number ? (return true) : (return false)
  end

  def set_ship_variables(x, y, direction)
    ship = @ships[@ship_number]
    ship.x_coordinate = x
    ship.y_coordinate = y
    ship.direction = direction
  end

end
