require "io/console"
require_relative "board"
require "colorize"
require 'colorized_string'


KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_accessor :cursor_pos, :board, :toggle_selected

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    # String.disable_colorization = false # enable colorization
    @board = board
    # @board[cursor_pos].value.colorize(:blue)
    @toggle_selected = true
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when key == :return || key == :space
        if @toggle_selected == true
            @toggle_selected = false
        else
            @toggle_selected = true
        end
        return @cursor_pos
    when :left
        update_pos(MOVES[:left])
        return nil
    when :right
        update_pos(MOVES[:right])
        return nil
    when :down
        update_pos(MOVES[:down])
        return nil
    when :up
        update_pos(MOVES[:up])
        return nil
    when :ctrl_c
        Process.exit(0)
    else
        return "invalid input"
    end
  end

  def update_pos(diff)
    new_x = @cursor_pos[0] + diff[0]
    new_y = @cursor_pos[1] + diff[1]
    if @board.valid_pos?([new_x,new_y])
        @cursor_pos = [new_x,new_y]
    end
    return @cursor_pos
  end


end

# b = Cursor.new([0,0], c )
# puts @cursor_pos.colorize(:blue)
# puts b[[0,0]].value.colorize(:blue)
# @cursor_pos = [4,4]
