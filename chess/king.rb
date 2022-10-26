require_relative 'piece'
class King < Piece
    include Stepable
    attr_accessor :color, :board, :pos, :value
    def initialize(color, board, pos, value)
        super
    end

    def move_dirs
        king_moves
    end
end
