module Arelastic
  module Builders
    class Sort < Struct.new :field
      class << self
        def [](field)
          new(field)
        end
      end

      def asc(options = nil)
        Arelastic::Sorts::Field.new({field => 'asc'}, options)
      end

      def desc(options = nil)
        Arelastic::Sorts::Field.new({field => 'desc'}, options)
      end
    end
  end
end