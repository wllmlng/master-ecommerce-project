class Gesture
    attr_accessor :computer_gesture, :player_gesture
    OPTIONS = ["R", "P", "S"]
    def initialize(player_gesture)
        @computer_gesture = OPTIONS.sample
        @player_gesture = player_gesture.upcase
    end

    def rand_gesture
        @computer_gesture = OPTIONS.sample
    end

    # def player_gesture(input)
    #     @player_gesture = input.upcase
    # end
end