require 'memoizer'

module Interactors
  class Base
  end

  class ImportantThing < Base
    include Memoizer

    memoize :call

    def initialize(*args)
      # .... some setup
    end

    def call(*)
      'ImportantThing call method'
    end

    def non_memoized_method(*)
      'ImportantThing non_memoized_method'
    end
  end
end
