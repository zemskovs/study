require 'awesome_print'

module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      # написать сначала select, потом map, где разбить по количеству стран, потом reduce
      def rating(array)
        selection = array
                    .map { |film| map_film(film) }
                    .select { |film| select_film(film) }

        total_raiting = selection.reduce(0) { |acc, film| acc + film[:raiting] }
        total_count = selection.length

        return total_raiting / total_count
      end

      def chars_count(_films, _threshold)
        0
      end

      private

      def map_film(film)
        raiting = film['rating_kinopoisk'].to_s.to_f
        country_count = film['country'].to_s.split(',').length

        mapped_film = {
          raiting: raiting,
          country_count: country_count
        }

        mapped_film
      end

      def select_film(film)
        !film[:raiting].zero? && film[:country_count] >= 2
      end

      def reduce_film(raiting_params, film)
        raiting_params[:total_raiting] = raiting_params[:total_raiting] + film[:raiting].to_i,
                                         raiting_params[:total_count] = raiting_params[:total_count] + 1
      end
    end
  end
end
