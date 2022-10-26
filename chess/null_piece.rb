require_relative 'piece'
class NullPiece < Piece
    attr_accessor :color, :board, :pos, :value
    def initialize(color, board, pos, value)
        super
    end
end