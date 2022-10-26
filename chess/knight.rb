require_relative 'piece'
class Knight < Piece
    include Stepable
    attr_accessor :color, :board, :pos, :value
    def initialize(color, board, pos, value)
        super
    end

    def move_dirs
        knight_moves
    end
end
