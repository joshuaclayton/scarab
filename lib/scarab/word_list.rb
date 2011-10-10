module Scarab
  class WordList
    def initialize(letters)
      @letters = letters
    end

    def matches
      permutations = Parser.new(@letters).expand.inject([]) do |results, letters|
        results << letter_combinations(letters)
        results
      end.flatten.uniq

      permutations.inject([]) do |results, permutation|
        results << self.class.words_hash[permutation]
        results
      end.flatten.sort_by(&:length).reverse
    end

    private

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
