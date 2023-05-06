require 'pry-byebug'

class Codebreaker
    attr_reader :last_guess
    attr_writer :feedback
    
    def initialize
        @last_guess = []
        @feedback = []
    end

    def update_last (guess)
        @last_guess = guess
    end

    def generate_guess
        guess = @last_guess == [] ? ['1','1','1','1'] : analyze_feedback
        update_last(guess)
        guess
    end

    def analyze_feedback
        # ◯ ✔
        guess = []
        @feedback.each_with_index do |symbol, i|
            if symbol == '✔'
                guess.push(@last_guess[i])
            else
                guess.push(String(Integer(@last_guess[i]) + 1))
            end
        end
        guess
    end
end