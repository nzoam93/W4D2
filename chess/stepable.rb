require_relative 'piece'
module Stepable
    def knight_moves
        
    end

    def king_moves
        [[1,1,],[1,-1],[-1,1],[-1,-1]] + [[1,0],[0,1],[-1,0],[0,-1]]
    end

end
