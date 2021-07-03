module Exercise
  module Arrays
    class << self
      def replace(array)
        max_array_number = array.min { |a, b| b <=> a }
        replaced_array = array.map { |num| replace_negative(num, max_array_number) }
        replaced_array
      end

      def search(_array, _query)
        0
      end

      private

      def replace_negative(num, max_num)
        return max_num if num.positive?

        num
      end
    end
  end
end
