require "active_support/core_ext/array/grouping"

module Scarab
  class Cli
    def initialize(*args)
      list = WordList.new(args.first).to_a
      longest = list.sort_by(&:length).reverse.first.length

      terminal_width = Integer(`tput cols`.strip)
      columns = terminal_width/(longest + 4)

      list.in_groups_of(columns).each do |row|
        puts row.map {|word| sprintf("%-#{longest + 4}s", word) }.join
      end
    end
  end
end
