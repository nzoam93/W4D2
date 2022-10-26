require_relative 'piece'
class Queen < Piece
    include Slideable
    attr_accessor :color, :board, :pos, :value
    def initialize(color, board, pos, value)
        super
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end

    # p moves
end
