require 'colorize'
require_relative 'cursor.rb'
require_relative 'board' 
class Display
    def initialize
        
        @cursor = Cursor.new([0,0],board)
    end

    def render
        puts "-------------------------"
        (0...@rows.length).each do |i|
            (0...@rows.length).each do |j|
                    print @rows[i][j]
            end
            puts
        end
        puts "-------------------------"
    end
end
