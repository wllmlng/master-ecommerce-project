require_relative "gestures"
require_relative "player"
class Game
    attr_accessor :rounds, :score

    def initialize(rounds)
        @rounds = rounds
        @score = [0, 0] #[player, computer]
    end

    def over?
        @rounds == 0
    end

    def winning?
        #  if self.over? 
        #     if @score[0] > @score[1] 
        #         return true 
        #     end
        # else
        #     false
        # end
        @score[0] > @score[1] 
    end

    def tie?
        @score[0] == @score[1]
    end
    
    def round
        @rounds -= 1
        print "Enter options R, P, or S: "
        gesture1 = Gesture.new(gets.chomp)
        comp = gesture1.rand_gesture
        if gesture1.player_gesture == comp
            print "You: #{gesture1.player_gesture}    Computer: #{comp}"
            print "You and the computer tied the round! Try again!"
        end

    end
    

end

print "Enter number of rounds: "
        rounds = gets.chomp.to_i
        round1 = Game.new(rounds)
        until round1.over?
            round1.round
        end
