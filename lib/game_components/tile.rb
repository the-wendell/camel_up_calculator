module CamelUpCalculator
  module GameComponents
    class Tile
      def initialize(type)
        @type = type
        validate_type
      end

      def desert?
        type == :desert
      end

      def oasis?
        type == :oasis
      end

      private

      attr_reader :type
      VALID_TYPES = %i[desert oasis].freeze

      def validate_type
        return if VALID_TYPES.include?(type)

        raise ArgumentError, "#{type} is an invalid Tile type"
      end
    end
  end
end