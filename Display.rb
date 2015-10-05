require 'colorize'
require_relative 'cursorable'

class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos =  [0,0]
    if @board[@cursor_pos].nil?
      @selected = false
    else
      @selected = true
    end
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
    end
  end

  def colors_for(i, j)
    if [i,j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg, color: :white}
  end

  def render
    system("clear")
    build_grid.each { |row| puts row.join }
  end

end