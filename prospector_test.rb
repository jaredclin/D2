require 'minitest/autorun'
require_relative 'prospector'

# UNIT TESTS FOR CLASS prospector
class ProspectorTest < Minitest::Test

  # UNIT TEST FOR METHOD Initial_vals
  # Initial_vals should return 1
  def test_initial_vals_return_value
    p = Prospector.new(1, 1, 1)
    turn = p.initial_vals
    assert_equal 1, turn
  end


end