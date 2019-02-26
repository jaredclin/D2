require_relative 'location'

# Prospector Class
class Prospector
  def initialize(seed, num_prospectors, num_turns)
    @seed = seed
    @num_prospectors = num_prospectors
    @num_turns = num_turns
    @l = Location.new(seed)
  end

  def run_program
    prospector = 1
    while prospector <= @num_prospectors
      # first location
      turn = 1
      @real_ruby_count = 0
      @fake_ruby_count = 0
      @days = 0
      current_location = 'Enumerable Canyon'
      current_location_index = @l.get_location_index(current_location)
      puts "\nRubyist #{prospector} starting in #{current_location}."
      search(current_location, current_location_index)

      # starts loop after 1st location
      next_location = @l.get_next_location(current_location_index)
      while turn < @num_turns
        puts "Heading from #{current_location} to #{next_location}."
        current_location = next_location
        current_location_index = @l.get_location_index(current_location)
        search(current_location, current_location_index)
        next_location = @l.get_next_location(current_location_index)
        turn += 1
      end
      puts "After #{@days} #{day_form(@days)}, Rubyist #{prospector} found:"
      puts "\t#{@real_ruby_count} #{ruby_form(@real_ruby_count)}."
      puts "\t#{@fake_ruby_count} #{ruby_form(@fake_ruby_count)}."
      mood(@real_ruby_count)
      prospector += 1
    end
  end

  def mood(real_ruby_count)
    mood_string = if real_ruby_count >= 10
                    'victorious!'
                  elsif real_ruby_count <= 9 && real_ruby_count >= 1
                    'sad.'
                  elsif real_ruby_count.zero?
                    'empty-handed'
                  end
    puts "Going home #{mood_string}"
  end

  def search(current_location, current_location_index)
    leave = false
    until leave
      real_rubies, fake_rubies = get_rubies(current_location_index)
      leave = print_rubies(real_rubies, fake_rubies, current_location)
      @real_ruby_count += real_rubies
      @fake_ruby_count += fake_rubies
      @days += 1
    end
  end

  def day_form(num)
    if @num == 1
      'day'
    else
      'days'
    end
  end

  def ruby_form(num)
    if num == 1
      'ruby'
    else
      'rubies'
    end
  end

  def get_rubies(location)
    real_rubies = @l.get_real_rubies(location)
    fake_rubies = @l.get_fake_rubies(location)
    [real_rubies, fake_rubies]
  end

  def print_rubies(real_rubies, fake_rubies, location)
    if real_rubies.zero? && fake_rubies.zero?
      puts "\tFound no rubies or fake rubies in #{location}."
      return true
    end

    if real_rubies.zero? && (fake_rubies != 0)
      puts "\tFound #{fake_rubies} fake #{ruby_form(fake_rubies)} in #{location}."
      return false
    end

    if (real_rubies != 0) && fake_rubies.zero?
      puts "\tFound #{real_rubies} #{ruby_form(real_rubies)} in #{location}."
      return false
    end

    # Guard cause question
    # wont return true of false, is that an issue?
    return unless (real_rubies != 0) && (fake_rubies != 0)

    puts "\tFound #{real_rubies} #{ruby_form(real_rubies)} and #{fake_rubies} fake #{ruby_form(fake_rubies)} in #{location}."
  end
end
