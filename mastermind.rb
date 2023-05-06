require 'pry-byebug'

class Mastermind
    require_relative 'display'
    require_relative 'codemaker'
    require_relative 'codebreaker'

    def initialize
        @role = nil
        @round = 1
        @winner = false
        @test = true
        @codemaker = Codemaker.new
        @codebreaker = Codebreaker.new
    end
    
    def start
        Display.intro
        set_role
        create_code
        start_role_based_loop
    end

    def get_role
        choice = gets.chomp
        unless valid_role(choice)
            Display.prompt_roles
            get_role
        end
        choice
    end

    def create_code
        if @role == 'codebreaker'
            @codemaker.generate_code
        else
            Display.prompt_code
            @codemaker.set_code(get_four_digits)
        end
    end

    def set_role
        choice = @test ? '2' : get_role
        @role = choice == '1' ? 'codemaker' : 'codebreaker'
    end

    def valid_role(string)
        string == '1' || string == '2'
    end

    def get_four_digits
        code = gets.chomp.gsub(/\s+/, "")
        if validate(code)
            return code.split('')
        else
            get_four_digits
        end
    end

    def check_guess(guess)
        @winner = guess == @codemaker.code
    end

    def validate(code)
        if code.length == 4 && code !~ /[^1-6]/
            return true
        end
        Display.entry_error
        false
    end

    def start_role_based_loop
        @role == 'codebreaker' && breaker_loop || @role == 'codemaker' && maker_loope
    end

    def breaker_loop
        until end_game?
            puts "This is the breaker loop..."
            p @codemaker.code
            Display.prompt_guess
            guess = get_four_digits
            check_guess(guess)
            @round += 1
        end

    end
    
    def maker_loop
        until end_game?
            puts "This is the maker loop..."
            @round += 1
        end
    end

    def end_game?
        @round == 12 || @winner
    end
end