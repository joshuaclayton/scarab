module Scarab
  class Cli
    def initialize(*args)
      puts WordList.new(args.first).matches.join("\n")
    end
  end
end
