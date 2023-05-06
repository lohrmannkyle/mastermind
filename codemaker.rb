class Codemaker
    attr_reader :code

    def initialize
        @code = nil
    end

    def set_code(code)
        @code = code
    end

    def generate_code
        set = ['1', '2', '3', '4']
        @code = set.sample(4)
    end
end
