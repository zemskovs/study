module Exercise
  module Arrays
    class << self
      def replace(array)
        max_array_number = array.max
        replaced_array = array.map { |num| replace_positive(num, max_array_number) }
        replaced_array
      end

      def search(array, query)
        return -1 if array.empty?

        middle_index = array.length / 2
        current_value = array[middle_index]

        return middle_index if current_value == query

        return search(array.take(middle_index), query) if query < current_value

        if query > current_value
          corrective_index = search(array.drop(middle_index + 1), query)
          corrective_index == -1 ? -1 : (middle_index + 1) + corrective_index
        end
      end

      private

      def replace_positive(num, max_num)
        return max_num if num.positive?

        num
      end
    end
  end
end
