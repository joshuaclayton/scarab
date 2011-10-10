require "active_support/core_ext/array/grouping"

module Scarab
  class Cli
    def initialize(*args)
      @word_list ||= WordList.new(args.first)

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
