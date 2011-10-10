module Scarab
  class Words
    def self.all
      @all ||= load_words
    end

    def self.two_letter_words
      all.select {|word| word.length == 2 }
    end

    def self.three_letter_words
      all.select {|word| word.length == 3 }
    end

    def self.load_words
      path = File.join(File.dirname(__FILE__), "word_list.txt")
      File.new(path).read.split(" ").map &:downcase
    end
    private_class_method :load_words
  end
end
