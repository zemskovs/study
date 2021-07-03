module Exercise
  module Arrays
    class << self
      def replace(array)
        max_array_number = array.min { |a, b| b <=> a }
        replaced_array = array.map { |num| replace_negative(num, max_array_number) }
        replaced_array
      end

      def search(_array, _query)
        return -1 if _array.empty?

        middle_index = _array.length / 2
        current_value = _array[middle_index]

        return middle_index if current_value == _query

        return search(_array.take(middle_index), _query) if _query < current_value

        if _query > current_value
          corrective_index = search(_array.drop(middle_index + 1), _query)
          corrective_index == -1 ? -1 : (middle_index + 1) + corrective_index
        end
      end

      private

      def replace_negative(num, max_num)
        return max_num if num.positive?

        num
      end
    end
  end
end
