module Arelastic
  module Queries
    class GeoDistance < Arelastic::Queries::Query
      attr_accessor :field, :location, :distance, :options
      def initialize(field, location, distance, options = {})
        @field = field
        @location = location
        @distance = distance
        @options = options
      end

      def as_elastic
        params = { field => location, "distance" => distance }.update(options)

        { "geo_distance" => params }
      end
    end
  end
end
