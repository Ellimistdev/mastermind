module CoreExtensions
  module Integer
    def digits
      Enumerator.new do |x|
        to_s.chars.map{|c| x << c.to_i }
      end
    end
  end
end