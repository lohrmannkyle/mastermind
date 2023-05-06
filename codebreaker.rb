class Codebreaker
    def initialize
        @guesses = {}
    end

    def add_guess (round, guess)
        @guesses[round] = guess
    end
end