module Arelastic
  module Aggregations
   class Filter < Arelastic::Aggregations::BucketAggregation
      attr_accessor :filter

      def initialize name, filter
        super name
        @filter = filter
      end

      def as_elastic_aggregation
        base_bucket_aggregation.merge!({'filter' => convert_to_elastic(filter)})
      end
    end
  end
end
