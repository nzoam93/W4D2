require_relative "require.rb"
require 'colorize'
class Board
    attr_accessor :rows
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance
        populate
        render
        # @piece = Piece.new()
    end

    def populate
        #pieces on row 0
        self[[0,0]]= Rook.new("white", self, [0,0],"r")
        self[[0,1]]= Knight.new("white", self, [0,1], "k")
        self[[0,2]]= Bishop.new("white", self, [0,2],"b")
        self[[0,3]]= Queen.new("white", self, [0,3], "q")
        self[[0,4]]= King.new("white", self, [0,4], "K")
        self[[0,5]]= Bishop.new("white", self, [0,5], "b")
        self[[0,6]]= Knight.new("white", self, [0,6], "k")
        self[[0,7]]= Rook.new("white", self, [0,7],"r")

        #pawns on row 1
        @rows[1].each_with_index do |ele, idx|
            @rows[1][idx] = Pawn.new("white", self, [1,idx],"p")
        end

        #null pieces on rows 2-5
        (2..5).each do |idx|
            (0..7).each do |idx2|
                @rows[idx][idx2] = @null_piece
            end
        end

        #pawns on row 6
        @rows[6].each_with_index do |ele, idx|
            @rows[6][idx] = Pawn.new("black", self, [6,idx],"p")
        end

        #pieces on row 7
        self[[7,0]]= Rook.new("black", self, [7,0],"r")
        self[[7,1]]= Knight.new("black", self, [7,1],"k")
        self[[7,2]]= Bishop.new("black", self, [7,2],"b")
        self[[7,3]]= Queen.new("black", self, [7,3],"q")
        self[[7,4]]= King.new("black", self, [7,4],"K")
        self[[7,5]]= Bishop.new("black", self, [7,5],"b")
        self[[7,6]]= Knight.new("black", self, [7,6],"k")
        self[[7,7]]= Rook.new("black", self, [7,7],"r")
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        if self[start_pos].is_a?(NullPiece)
            raise "There is no piece there"
        end
        if self.valid_pos?(end_pos)
            self[end_pos] = piece
            piece.pos = end_pos
            self[start_pos] = @null_piece
        end
        render
    end

    def valid_pos?(end_pos)
        # i, j = end_pos
        # if ( i < 0 || i > 7 || j < 0 || j > 7)
        #     # raise "Cannot move there"
        #     return false
        # else
        #     return true
        # end
        end_pos.all? {|ele| ele.between?(0,7)}
    end

    def teammate?(end_pos)
        if self[end_pos].color != self[pos].color  # look at self
            return false
        else
            return true
        end
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

    private
    attr_accessor :null_piece
end

# b = Board.new

# start_pos = [1,6]
# end_pos = [4,6]

# b.move_piece(start_pos, end_pos)
# p b[[4,6]].moves

# b.render
