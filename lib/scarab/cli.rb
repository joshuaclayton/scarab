module Scarab
  class Cli
    def initialize(*args)
      puts WordList.new(args.first).join("\n")
    end
  end
end
