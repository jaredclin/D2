require 'minitest/autorun'
require_relative 'location'

# UNIT TESTS FOR CLASS Location
class LocationTest < Minitest::Test

  # UNIT TEST FOR METHOD create_map
  # Equivalence classes:
  # array matches the map from the requirements -> valid
  # array does not match the map from the requirements -> invalid
  def test_create_map
    l = Location.new(0)
    assert_equal l.map, [
      ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City'],
      ['Duck Type Beach', 'Enumerable Canyon', 'Matzburg'],
      ['Monkey Patch City', 'Nil Town', 'Enumerable Canyon', 'Matzburg'],
      ['Nil Town', 'Monkey Patch City', 'Hash Crossing'],
      ['Matzburg', 'Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades'],
      ['Hash Crossing', 'Matzburg', 'Nil Town', 'Dynamic Palisades'],
      ['Dynamic Palisades', 'Matzburg', 'Hash Crossing']
    ]
  end
  
  # UNIT TEST FOR METHOD create_rubies
  # Equivalence classes:
  # array matches the ruby values from the requirements -> valid
  # array does not match the ruby values from the requirements -> invalid
  def test_create_rubies
    l = Location.new(0)
    assert_equal l.rubies, [[1, 1], [2, 2], [1, 1], [0, 3], [3, 0], [2, 2], [2, 2]]
  end
  
  # UNIT TEST FOR METHOD get_location_index
  # Equivalence classes:
  # Input is a location on the map -> valid
  # Input is not a location on the map -> invalid
  # 0 <= return value <= 6 -> valid
  # return value > 6 or return value < 0 -> invalid
  def test_get_location_enumerable_canyon
    l = Location.new(0)
    assert_equal 0, l.get_location_index('Enumerable Canyon')
  end
  
  def test_get_location_dynamic_palisades
    l = Location.new(0)
    assert_equal 6, l.get_location_index('Dynamic Palisades')
  end

  def test_get_location_pittsburgh
    l = Location.new(0)
    assert_raises 'InvalidLocationError' do
      l.get_location_index('Pittsburgh')
    end
  end
  
  # UNIT TEST FOR METHOD get_real_rubies
  def test_get_real_rubies
    l = Location.new(0)
    real_rubies = l.get_real_rubies(0)
    assert 0 <= real_rubies
    assert l.rubies[0][0] => real_rubies
  end
  
  # UNIT TEST FOR METHOD get_fake_rubies
  def test_get_fake_rubies
    l = Location.new(0)
    fake_rubies = l.get_fake_rubies(0)
    assert 0 <= fake_rubies
    assert l.rubies[0][1] => fake_rubies
  end
  
  # UNIT TEST FOR METHOD get_next_location
  def test_get_next_location
    l = Location.new(0)
    assert_includes l.map[0], l.get_next_location(0)
  end
end
