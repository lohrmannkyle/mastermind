class Mastermind
    require_relative 'display'
    require_relative 'codemaker'
    require_relative 'codebreaker'

    def initialize
        @role = nil
        @round = 1
        @winner = false
    end
    
    def start
        Display.intro
        choice = self.get_role
        self.update_role(choice)
        until @round > 12 || @winner
            @round += 1
        end
    end

    def get_role
        choice = gets.chomp
        unless self.valid_role(choice)
            Display.prompt_roles
            self.get_role
        end
        choice
    end

    def update_role(string)
        string == '1' && @role = 'codemaker' || string == 'codebreaker' && @role = 2
    end

    def valid_role(string)
        string == '1' || string == '2'
    end    
end