require 'helper'

class Arelastic::FilterTest < Minitest::Test
  def test_or
    filter = Arelastic::Filters::Filter.new

    and_filter = filter.and(filter)

    assert and_filter.is_a?(Arelastic::Filters::And)
    assert_equal [filter, filter], and_filter.children
  end

  def test_and
    filter = Arelastic::Filters::Filter.new

    and_filter = filter.or(filter)

    assert and_filter.is_a?(Arelastic::Filters::Or)
    assert_equal [filter, filter], and_filter.children
  end

  def test_nested
    filter = Arelastic::Filters::Term.new('foo', 'bar')

    nested_filter = filter.nested 'links'

    assert nested_filter.is_a?(Arelastic::Filters::Nested)
    expected = {
      "nested" => {
        "path" => "links",
        "filter" => filter.as_elastic
      }
    }
    assert_equal(expected, nested_filter.as_elastic)
  end
end
