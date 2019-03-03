require_relative 'location'

# Prospector Class
class Prospector

  def initialize(seed, num_prospectors, num_turns)
    @seed = seed
    @num_prospectors = num_prospectors
    @num_turns = num_turns
    @l = Location.new(seed)
  end

  def initial_vals
    @real_ruby_count = 0
    @fake_ruby_count = 0
    @days = 0

    @current_location = 'Enumerable Canyon'
    @current_location_index = @l.get_location_index(@current_location)
    1
  end

  def go_to_next_location_and_search(next_location)
    current_location = next_location
    current_location_index = @l.get_location_index(current_location)
    search(current_location, current_location_index)
    next_location = @l.get_next_location(current_location_index)
    [current_location, next_location]
  end

  def print_output(prospector_num)
    puts "After #{@days} #{day_form(@days)}, Rubyist #{prospector_num} found:"
    puts "\t#{@real_ruby_count} #{ruby_form(@real_ruby_count)}."
    puts "\t#{@fake_ruby_count} fake #{ruby_form(@fake_ruby_count)}."
    mood(@real_ruby_count)
  end

  def run_one_iteration(prospector_num, num_turns)
    turn = initial_vals
    puts "\nRubyist #{prospector_num} starting in #{@current_location}."
    current_location, next_location = go_to_next_location_and_search(@current_location)
    turn += 1

    while turn <= num_turns
      puts "Heading from #{current_location} to #{next_location}."
      current_location, next_location = go_to_next_location_and_search(next_location)
      turn += 1
    end
    print_output(prospector_num)
  end

  def mood(real_ruby_count)
    mood_string = if real_ruby_count >= 10
                    'victorious!'
                  elsif real_ruby_count <= 9 && real_ruby_count >= 1
                    'sad.'
                  elsif real_ruby_count.zero?
                    'empty-handed.'
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
    if num == 1
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

  def print_rubies(real_ruby, fake_ruby, location)
    if real_ruby.zero? && fake_ruby.zero?
      puts "\tFound no rubies or fake rubies in #{location}."
      return true
    end

    if real_ruby.zero? && (fake_ruby != 0)
      puts "\tFound #{fake_ruby} fake #{ruby_form(fake_ruby)} in #{location}."
      return false
    end

    if (real_ruby != 0) && fake_ruby.zero?
      puts "\tFound #{real_ruby} #{ruby_form(real_ruby)} in #{location}."
      return false
    end

    return unless (real_ruby != 0) && (fake_ruby != 0)

    puts "\tFound #{real_ruby} #{ruby_form(real_ruby)} and #{fake_ruby} fake #{ruby_form(fake_ruby)} in #{location}."
  end
end
