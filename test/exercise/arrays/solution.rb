module Exercise
  module Arrays
    class << self
      def replace(array)
        max_array_number = array.max
        replaced_array = array.map { |num| replace_positive(num, max_array_number) }
        replaced_array
      end

      def search(array, query, min_index = 0, max_index = array.size - 1)
        return - 1 if max_index < min_index

        middle_index = min_index + (max_index - min_index) / 2
        current_value = array[middle_index]

        if current_value > query
          max_index = middle_index - 1
          return search(array, query, min_index, max_index)
        end

        if current_value < query
          min_index = middle_index + 1
          return search(array, query, min_index, max_index)
        end

        middle_index
      end

      private

      def replace_positive(num, max_num)
        return max_num if num.positive?

        num
      end
    end
  end
end
