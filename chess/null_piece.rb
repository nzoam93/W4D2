require_relative 'piece'
require 'singleton'
class NullPiece < Piece
    include Singleton   
    attr_reader :value
    def initialize

        @value = "."
    end

    def empty?
        true
    end
end