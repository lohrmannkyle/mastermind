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
        until @round > 12 || @winner
            puts @round
            @round += 1
        end
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
            @codemaker.set_code('1234')
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
        code = gets.chomp
        if validate(code)
            return code
        else
            get_four_digits
        end
    end

    def make_guess
        ###
    end

    def validate(code)
        code = code.gsub(/\s+/, "")
        if code.length == 4 && code !~ /[^1-6]/
            return true
        end
        Display.entry_error
        false
    end
end