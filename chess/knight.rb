require_relative 'piece'
class Knight < Piece
    attr_accessor :color, :board, :pos, :value
    def initialize(color, board, pos, value)
        super
        
    end
end