require 'colorize'
require_relative 'cursor.rb'
class Display
    def initialize
        @cursor = Cursor.new([0,0],board)
    end
end
