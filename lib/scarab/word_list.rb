module Scarab
  class WordList
    include Enumerable

    def initialize(letters)
      @letters = letters
      @words   = calculate_matches
    end

    def each(&block)
      @words.each(&block)
    end

    def length
      @words.length
    end

    def longest
      @words.select {|word| word.length == max_length }
    end

    def max_length
      @words.sort_by(&:length).reverse.first.length
    end

    private

    def calculate_matches
      permutations = Parser.new(@letters).expand.inject([]) do |results, letters|
        results << letter_combinations(letters)
        results
      end.flatten.uniq

      permutations.inject([]) do |results, permutation|
        results << self.class.words_hash[permutation]
        results
      end.flatten.sort_by(&:length).reverse
    end


    def letter_combinations(letters)
      result = []

      arr = letters.split(//)

      (1..letters.length).each do |i|
        arr.combination(i) {|x| result << x.sort.join }
      end

      result.uniq
    end

    def self.words_hash
      @words_hash ||= begin
        result = Hash.new([])

        Words.all.each do |word|
          result[word.split(//).sort.join] += [word]
        end

        result
      end
    end
  end
end
