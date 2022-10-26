require_relative 'piece'
class King < Piece
    include Slideable
    attr_accessor :color, :board, :pos, :value
    def initialize(color, board, pos, value)
        super
    end
end