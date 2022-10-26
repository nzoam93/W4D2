require_relative 'piece'
class Bishop < Piece
    include Slideable
    attr_accessor :color, :board, :pos, :value
    def initialize(color, board, pos, value)
        super
    end
end