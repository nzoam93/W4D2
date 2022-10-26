require_relative 'piece'
require 'singleton'
class NullPiece < Piece
    include Singleton
    attr_reader :value
    def initialize

        @value = "."
        @color = nil
        @symbol = :n
    end

    def empty?
        true
    end
end
