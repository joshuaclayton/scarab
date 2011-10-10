module Scarab
  class Parser
    def initialize(letters)
      @letters = letters
    end

    def expand
      return [@letters] unless wildcards?

      ("a".."z").inject([]) do |result, letter|
        result << Parser.new(@letters.dup.sub(/\?/, letter)).expand
        result
      end.flatten
    end

    private

    def wildcards?
      @letters.split(//).include?("?")
    end
  end
end
