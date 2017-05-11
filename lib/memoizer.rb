module Memoizer
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    def memoize(*methods)
      memoizer = Module.new do
        methods.each do |method|
          define_method method do |*args|
            if args.empty?
              return @return_value ||= super()
            else
              @return_value_with_args ||= Hash.new
              @return_value_with_args[args] ||= super(args)
              return @return_value_with_args[args]
            end
          end
        end
      end
      prepend memoizer
    end
  end
end
