class Display
    def self.intro
        puts `clear`
        puts "\nWelcome to Mastermind! A game where the codemaker chooses four colors"
        puts 'and the codebreaker attempts to guess the colors and order in which they'
        puts "were chosen. 12 guesses are given. Good luck and have fun!\n\n"
        prompt_roles
    end

    def self.prompt_roles
        puts 'Would you like to be the codemaker or codebreaker?'
        puts "Enter 1 for codemaker or 2 for codebreaker:\n\n"
    end

    def self.display_colors
        puts '1: Red'
        puts '2: Green'
        puts '3: Yellow'
        puts '4: Blue'
        puts '5: Pink'
        puts '6. Purple'
    end

    def self.prompt_code
        puts 'Please choose four colors for your code.'
        puts 'Use the numeric assignment.'
        display_colors
    end
    
    def self.prompt_guess
        puts 'Please enter four of the following colors using their numeric value on a single line for your guess.'
        display_colors
    end

    def self.entry_error
        puts `clear`
        puts 'Invalid entry.'
        puts "Please enter four digits on a single line from 1-6.\n"
    end
end
