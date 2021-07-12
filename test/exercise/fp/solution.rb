require 'awesome_print'

module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selection = array
                    .map { |film| map_raiting_film(film) }
                    .select { |film| select_raiting_film(film) }

        total_raiting = selection.reduce(0) { |acc, film| acc + film[:raiting] }
        total_count = selection.length

        total_raiting / total_count
      end

      def chars_count(films, threshold)
        selection = films.select { |film| select_chars_film(film, threshold) }.map { |film| map_chars_film(film) }
        selection.sum
      end

      private

      def map_raiting_film(film)
        raiting = film['rating_kinopoisk'].to_s.to_f
        country_count = film['country'].to_s.split(',').length

        mapped_film = {
          raiting: raiting,
          country_count: country_count
        }

        mapped_film
      end

      def select_raiting_film(film)
        !film[:raiting].zero? && film[:country_count] >= 2
      end

      def select_chars_film(film, raiting)
        film_raiting = film['rating_kinopoisk'].to_s.to_f
        film_raiting >= raiting
      end

      def map_chars_film(film)
        film['name'].to_s.scan('и').count
      end
    end
  end
end
