module CoreExtensions
  module Integer
    # module to treat ints as set of digits
    module Digits
      # turns an int into an array of ints to operate on as digits
      def digits
        Enumerator.new do |x|
          to_s.chars.map { |c| x << c.to_i }
        end
      end
    end
  end
end

Integer.include CoreExtensions::Integer::Digits
