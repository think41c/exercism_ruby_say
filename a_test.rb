gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'a'

class ATest < Minitest::Test
  def test_lower_bound
    assert_raises ArgumentError do
      A.new(-1).in_english
    end
  end
end
