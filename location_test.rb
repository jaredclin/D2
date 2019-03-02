require 'minitest/autorun'
require_relative 'location'

# UNIT TESTS FOR CLASS Location
class LocationTest < Minitest::Test

  # UNIT TEST FOR METHOD create_map
  # If a location object is created, the map created will match the map from the requirements
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
  # If a location object is created, the rubies created will match the ruby values from the requirements
  def test_create_rubies
    l = Location.new(0)
    assert_equal l.rubies, [[1, 1], [2, 2], [1, 1], [0, 3], [3, 0], [2, 2], [2, 2]]
  end
  
  # UNIT TEST FOR METHOD get_location_index
  # Equivalence classes:
  # Input is a location on the map -> valid
  # Input is not a location on the map -> invalid

  # If Enumerable Canyon is passed in, return 0
  def test_get_location_enumerable_canyon
    l = Location.new(0)
    assert_equal 0, l.get_location_index('Enumerable Canyon')
  end
  
  # If Duck Type Beach is passed in, return 1
  def test_get_location_duck_type_beach
    l = Location.new(0)
    assert_equal 1, l.get_location_index('Duck Type Beach')
  end

  # If Monkey Patch City is passed in, return 2
  def test_get_location_monkey_patch_city
    l = Location.new(0)
    assert_equal 2, l.get_location_index('Monkey Patch City')
  end

  # If Nil Town is passed in, return 3
  def test_get_location_nil_town
    l = Location.new(0)
    assert_equal 3, l.get_location_index('Nil Town')
  end

  # If Matzburg is passed in, return 4
  def test_get_location_matzburg
    l = Location.new(0)
    assert_equal 4, l.get_location_index('Matzburg')
  end

  # If Hash Crossing is passed in, return 5
  def test_get_location_hash_crossing
    l = Location.new(0)
    assert_equal 5, l.get_location_index('Hash Crossing')
  end

  # If Dynamic Palisades is passed in, return 6
  def test_get_location_dynamic_palisades
    l = Location.new(0)
    assert_equal 6, l.get_location_index('Dynamic Palisades')
  end

  # If a location not on the map is passed in, InvalidLocationError is raised
  # EDGE CASE
  def test_get_location_pittsburgh
    l = Location.new(0)
    assert_raises 'InvalidLocationError' do
      l.get_location_index('Pittsburgh')
    end
  end
  
  # UNIT TEST FOR METHOD get_real_rubies
  # Equivalence classes:
  # 0 =< x <= 6 -> valid
  # x not an int from 0 to 6 -> invalid

  # If a location from 0 to 6 is passed in, return a value that is from 0 to the max ruby value at that location
  def test_valid_real_rubies
    l = Location.new(0)
    real_rubies = l.get_real_rubies(0)
    assert 0 <= real_rubies
    assert l.rubies[0][0] => real_rubies
  end

  # If a location not from 0 to 6 is passed in, IndexError is raised
  # EDGE CASE
  def test_invalid_real_rubies
    l = Location.new(0)
    assert_raises 'IndexError' do
      real_rubies = l.get_real_rubies(7)
    end
  end
  
  # UNIT TEST FOR METHOD get_fake_rubies
  # Equivalence classes:
  # 0 =< x <= 6 -> valid
  # x not an int from 0 to 6 -> invalid

  # If a location from 0 to 6 is passed in, return a value that is from 0 to the max fake ruby value at that location
  def test_valid_fake_rubies
    l = Location.new(0)
    fake_rubies = l.get_fake_rubies(0)
    assert 0 <= fake_rubies
    assert l.rubies[0][1] => fake_rubies
  end

  # If a location not from 0 to 6 is passed in, IndexError is raised
  # EDGE CASE
  def test_invalid_fake_rubies
    l = Location.new(0)
    assert_raises 'IndexError' do
      fake_rubies = l.get_fake_rubies(7)
    end
  end
  
  # UNIT TEST FOR METHOD get_next_location
  # Equivalence classes:
  # 0 =< x <= 6 -> valid
  # x not an int from 0 to 6 -> invalid

  # If a location from 0 to 6 is passed in, return a value that is included in that location array
  def test_valid_next_location
    l = Location.new(0)
    assert_includes l.map[0], l.get_next_location(0)
  end

  # If a location not frmo 0 to 6 is passed in, IndexError is raised
  # EDGE CASE
  def test_invalid_next_location
    l = Location.new(0)
    assert_raises 'IndexError' do
      l.get_next_location(7)
    end
  end
end
