require 'colorize'
require_relative 'cursor.rb'
require_relative 'board'
class Display
    attr_accessor :board, :cursor
    def initialize(board, cursor)
        @board = board
        @cursor = cursor
        # @cursor = Cursor.new([0,0],board)
    end

    def render
        cursor_position = @cursor.cursor_pos
        puts "-------------------------"
        (0...@board.rows.length).each do |i|
            (0...@board.rows.length).each do |j|
                if i == cursor_position[0] && j == cursor_position[1]
                    if @cursor.toggle_selected == true
                        print @board.rows[i][j].value.colorize(:color => :black, :background => :red)
                    else
                        print @board.rows[i][j].value.colorize(:color => :black, :background => :blue)
                    end
                else
                    print @board.rows[i][j].value
                end
            end
            puts
        end
        puts "-------------------------"
        # p @board.rows[cursor_position[0]][cursor_position[1]].value.colorize(:blue) #just doing the string
        print @cursor.toggle_selected
    end
end

puts "This is blue".colorize(:blue)

b = Board.new
cursor_instance = Cursor.new([4,4],b)
d = Display.new(b, cursor_instance)

loop do
    cursor_instance.get_input
    d.render
end
