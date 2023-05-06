class Codebreaker
    attr_reader :guesses
    
    def initialize
        @last_guess = []
        @feedback = []
    end

    def update_last (guess)
        @last_guess = guess
    end

    def generate_guess
        unless @guesses
            return ['1','2','3','4']
        end
        analyze_feedback
    end

    def add_feedback(result)
        @feedback.push(result)
    end

    def analyze_feedback
        guess = []
        somewhere = nil
        @feedback.each_with_index do |i,symbol|
            if symbol == "✔"
                guess.push(@last_guess[i])
            elsif symbol == '◯'
                somewhere = @last_guess[i]
                guess.push(String(Integer(somewhere) + 1))
            elsif somewhere
                guess.push(somewhere)
            else
                guess.push(String(Integer(@last_guess[i]) + 1))
            end
        end
        guess
    end


end