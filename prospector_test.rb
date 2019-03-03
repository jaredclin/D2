require 'minitest/autorun'
require_relative 'prospector'

# UNIT TESTS FOR CLASS prospector
class ProspectorTest < Minitest::Test

  # Unit test for method Initial_vals
  # Initial_vals should return 1
  def test_initial_vals_return_value
    p = Prospector.new(1, 1, 1)
    turn = p.initial_vals
    assert_equal 1, turn
  end

  # after calling initial_vals, real_ruby_count should be 0
  def test_initial_vals_real_ruby_count
    p = Prospector.new(1, 1, 1)
    turn = p.initial_vals
    assert_equal p.real_ruby_count, 0
  end

  # after calling initial_vals, fake_ruby_count should be 0
  def test_initial_vals_fake_ruby_count
    p = Prospector.new(1, 1, 1)
    turn = p.initial_vals
    assert_equal p.fake_ruby_count, 0
  end

  # after calling initial_vals, days should be 0
  def test_initial_vals_days
    p = Prospector.new(1, 1, 1)
    turn = p.initial_vals
    assert_equal p.days, 0
  end

  # after calling initial_vals, current_location should be 'Enumerable Canyon'
  def test_initial_vals_current_location
    p = Prospector.new(1, 1, 1)
    turn = p.initial_vals
    assert_equal p.current_location, 'Enumerable Canyon'
  end

  # after calling initial_vals, current_location_index should be 0
  def test_initial_vals_current_location_index
    p = Prospector.new(1, 1, 1)
    turn = p.initial_vals
    assert_equal p.current_location_index, 0
  end


end