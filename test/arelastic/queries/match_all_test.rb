require 'helper'

class Arelastic::Queries::MatchAllTest < Minitest::Test
  def test_as_elastic
    match_all = Arelastic::Queries::MatchAll.new
    expected = {"match_all" => {}}

    assert_equal expected, match_all.as_elastic
  end
end