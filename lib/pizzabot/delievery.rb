module Pizzabot
  class Delievery
    attr_accessor  :coordinates, :starting_location, :directions, :grid

    def initialize(command)
      @coordinates = format_coordinates(command.scan(/\(.*?\)/))
      @starting_location = { x_axis: 0, y_axis: 0 }
      @directions = []
      @grid = command[/\d[x]\d/]
      move
    end

    private

      def move_number(coordinate)
        {
          x_move: coordinate[:x_axis] - @starting_location[:x_axis],
          y_move: coordinate[:y_axis] - @starting_location[:y_axis]
        }
      end

      def move
        @coordinates.each do |coordinate|
          mn = move_number(coordinate)
          assign_x_direction(mn)
          assign_y_direction(mn)
          @directions << "D"
          @starting_location = coordinate
        end
      end

      def format_coordinates(coordinates)
        coordinates.map do |coordinate|
          {
            x_axis: coordinate.gsub(/[^\d,\.]/, '').split(',').first.to_i,
            y_axis: coordinate.gsub(/[^\d,\.]/, '').split(',').last.to_i
          }
        end
      end

       def assign_y_direction(mn)
        if mn[:y_move] > 0
          mn[:y_move].times { @directions << 'N'}
        else
          mn[:y_move].abs.times { @directions << 'S'}
        end
      end

      def assign_x_direction(mn)
        if mn[:x_move] > 0
          mn[:x_move].times { @directions << 'E'}
        else
          mn[:x_move].abs.times { @directions << 'W'}
        end
      end

  end
end
