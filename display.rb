class Display
    def self.intro
        puts "\nWelcome to Mastermind! A game where the codemaker chooses four colors"
        puts 'and the codebreaker attempts to guess the colors and order in which they'
        puts "were chosen. 12 guesses are given. Good luck and have fun!\n\n"
        self.prompt_roles
    end

    def self.prompt_roles
        puts "Would you like to be the codemaker or codebreaker?"
        puts "Enter 1 for codemaker or 2 for codebreaker: "
    end
end
