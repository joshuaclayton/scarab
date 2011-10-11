require "active_support/core_ext/array/grouping"
require "thor"

module Scarab
  class Cli < Thor
    method_option :matching, :type => :string
    desc "match", "Match text"
    def match(text)
      @word_list = WordList.new(text)

      if regexp = options[:matching]
        @word_list.matching(Regexp.new(regexp))
      end

      @word_list.to_a.in_groups_of(column_count).each do |row|
        puts row.map {|word| sprintf("%-#{column_width}s", word) }.join
      end
    end

    private

    def terminal_width
      Integer(`tput cols`.strip)
    end

    def column_count
      terminal_width/column_width
    end

    def column_width
      @word_list.max_length + 4
    end
  end
end
