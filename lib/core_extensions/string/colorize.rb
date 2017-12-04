module CoreExtensions
  module String
    module Colorize
      def colorize(code)
        "\e[#{code}m#{self}\e[0m"
      end
      
      def red
        colorize(31)
      end

      def green
        colorize(32)
      end

      def yellow
        colorize(33)
      end

      def blue
        colorize(34)
      end
  
      def magenta
        colorize(35)
      end

      def cyan
        colorize(36)
      end
    end
  end
end

String.include CoreExtensions::String::Colorize
