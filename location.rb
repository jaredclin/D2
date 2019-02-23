# Location Class
class Location
  attr_reader :map
  attr_reader :rubies

  def initialize(seed)
    @rng = Random.new(seed.to_i)
    create_map
    create_rubies
  end

  def create_map
    @map = [
      ['Enumerable Canyon', 'Duck Type Beach', 'Monkey Patch City'],
      ['Duck Type Beach', 'Enumerable Canyon', 'Matzburg'],
      ['Monkey Patch City', 'Nil Town', 'Enumerable Canyon', 'Matzburg'],
      ['Nil Town', 'Monkey Patch City', 'Hash Crossing'],
      ['Matzburg', 'Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades'],
      ['Hash Crossing', 'Matzburg', 'Nil Town', 'Dynamic Palisades'],
      ['Dynamic Palisades', 'Matzburg', 'Hash Crossing']
    ]
  end

  # [real rubies, fake rubies]
  def create_rubies
    @rubies = [[1, 1], [2, 2], [1, 1], [0, 3], [3, 0], [2, 2], [2, 2]]
  end

  # add input check for methods below
  def get_location_index(location)
    index = if location == 'Enumerable Canyon'
              0
            elsif location == 'Duck Type Beach'
              1
            elsif location == 'Monkey Patch City'
              2
            elsif location == 'Nil Town'
              3
            elsif location == 'Matzburg'
              4
            elsif location == 'Hash Crossing'
              5
            elsif location == 'Dynamic Palisades'
              6
            end
    index
  end

  def get_real_rubies(location)
    real_rubies = @rng.rand(0..@rubies[location][0]).to_i
    real_rubies
  end

  def get_fake_rubies(location)
    fake_rubies = @rng.rand(0..@rubies[location][1]).to_i
    fake_rubies
  end

  def get_next_location(current_location)
    range = @map[current_location].length
    next_location_index = @rng.rand(1..range)
    next_location = @map[current_location][next_location_index]
    next_location
  end
end
