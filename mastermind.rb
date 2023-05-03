class Mastermind
    require_relative 'display'

    def initialize
        @codemaker = nil
        @codebreaker = nil
        @turn = nil
    def start
        Display.intro
    end
end
