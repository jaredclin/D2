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

  # QUESTION 1 IN EMAIL
  
  #UNIT TEST FOR METHOD go_to_next_location_and_search
  # method should take in next_location and return updated values of current_location and next_location
  def test_go_to_next_location_and_search
    next_location = 'Pitt'
    p = Prospector.new(1, 1, 1)
    p.initial_vals
    l = p.l
    location = MiniTest::Mock.new
    location.expect :get_location_index, nil, 1
    location.expect :get_next_location, nil, 'CMU'
    def p.search(current_location, current_location_index); 1; end

    current_location, next_location = p.go_to_next_location_and_search(next_location)
    assert_equal current_location, 'Pitt'
    assert_equal next_location, 'CMU'
  end

  # QUESTION 2 IN EMAIL
  
  # UNIT TEST FOR METHOD print_output
  # Method uses prospector_num as the Rubyist # when printing
  def test_print_output
    p = Prospector.new(1, 1, 1)
    p.initial_vals
    def p.day_form(num); 'days'; end
    def p.ruby_form(num); 'rubies'; end
    def p.mood(real_ruby_count); 1; end
    assert_output ("After 0 days, Rubyist 42 found:\n\t0 rubies.\n\t0 fake rubies.\n") {p.print_output(42) }
  end

  # QUESTION 3 IN EMAL
  
  # UNIT TEST FOR METHOD run_one_iteration
  # what am i testing here aaaaa
  def test_run_one_iteration
    p = Prospector.new(1, 1, 1)
    p.initial_vals
    def p.go_to_next_location_and_search(current_location); ['Enumerable Canyon', 'Pitt']; end
    def p.print_output(num); 1; end
    assert_output ("\nRubyist 1 starting in Enumerable Canyon.\nHeading from Enumerable Canyon to Pitt.\n") {p.run_one_iteration(1, 2)}
  end

  # UNIT TEST FOR METHOD mood
  # Equivalence classes:
  # x >= 10 -> method prints 'Going home victorious!'
  # 9 => x >= 1 -> method prints 'Going home sad.'
  # x =0 -> method prints 'Going home empty-handed.'

  # If x >= 10, method prints 'Going home victorious!'
  # EDGE CASE
  def test_mood_ten
    p = Prospector.new(1, 1, 1)
    assert_output ("Going home victorious!\n") {p.mood(10) }
  end

  # If x <= 9 && x >= 1, method prints 'Going home sad.'
  def test_mood_one
    p = Prospector.new(1, 1, 1)
    assert_output ("Going home sad.\n") {p.mood(1) }
  end

  # If x = 0, method prints 'Going home empty-handed.'
  def test_mood_zero
    p = Prospector.new(1, 1, 1)
    assert_output ("Going home empty-handed.\n") {p.mood(0) }
  end

  # QUESTION 4 IN EMAIL
  
  # UNIT TEST FOR METHOD search
  def test_search
    p = Prospector.new(1, 1, 1)
    p.initial_vals
    def p.get_rubies(c); [4, 2]; end
    def p.print_rubies(r, f, c); 1; end
    p.search('Pitt', 1)
    assert_equal 4, p.real_ruby_count
    assert_equal 2, p.fake_ruby_count
    assert_equal 1, p.days
  end
    

  # UNIT TEST FOR METHOD day_form
  # Equivalence classes:
  # x = 1 -> return 'day'
  # x > 1 -> return 'days'
  
  # If x = 1, return 'day'
  def test_day_form_one
    p = Prospector.new(1, 1, 1)
    assert_equal 'day', p.day_form(1)
  end

  # If x > 1, return 'days'
  def test_day_form_ten
    p = Prospector.new(1, 1, 1)
    assert_equal 'days', p.day_form(10)
  end

  # UNIT TEST FOR METHOD ruby_form
  # Equivalence classes:
  # x = 1 -> return 'ruby'
  # x > 1 -> return 'rubies'
  
  # If x = 1, return 'ruby'
  def test_ruby_form_one
    p = Prospector.new(1, 1, 1)
    assert_equal 'ruby', p.ruby_form(1)
  end

  # If x > 1, return 'rubies'
  def test_ruby_form_ten
    p = Prospector.new(1, 1, 1)
    assert_equal 'rubies', p.ruby_form(10)
  end

  # UNIT TEST FOR METHOD get_rubies
  # get_rubies returns real_rubies and fake_rubies as an array
  def test_get_rubies
    p = Prospector.new(1, 1, 1)
    l = p.l
    def l.get_real_rubies(location); 4; end
    def l.get_fake_rubies(location); 2; end
    x, y = p.get_rubies(0);
    assert_equal x, 4 
    assert_equal y, 2
  end

  # QUESTION 5 IN EMAIL
  
  # UNIT TEST FOR METHOD print_rubies
  # Equivalence classes:
  # Note: [] indicates value of said variable
  # form of ruby is determined with ruby_form method, not tested here
  # real_ruby = 0 && fake_ruby = 0 -> method prints 'Found no rubies or fake rubies in [location]'
  # real_ruby = 0 && fake_ruby != 0 -> method prints 'Found [fake_ruby] fake ruby (or rubies) in [location]
  # real_ruby != 0 && fake_ruby = 0 -> method prints 'Found [real_ruby] ruby (or rubies) in [location]
  # real_ruby != 0 && fake_ruby 1= 0 -> method prints 'Found [real_ruby] real ruby (or rubies) and [fake_ruby] fake ruby (or rubies) in [location]

  # real_ruby = 0, fake_ruby = 0, method prints 'Found no rubies and fake rubies in [location]
  def test_print_rubies_zero_zero
    p = Prospector.new(1, 1, 1)
    assert_output ("\tFound no rubies or fake rubies in Pitt.\n") {p.print_rubies(0, 0, 'Pitt') }
  end

  # real_ruby = 0, fake_ruby != 0, ,method prints 'Found [fake_ruby] fake ruby (or rubies) in [location]
  def test_print_rubies_zero_one
    p = Prospector.new(1, 1, 1)
    def p.ruby_form(num); 'ruby'; end
    assert_output ("\tFound 1 fake ruby in Pitt.\n") {p.print_rubies(0, 1, 'Pitt') }
  end

  # real_ruby != 0, fake_ruby = 0, ,method prints 'Found [real_ruby] ruby (or rubies) in [location]
  def test_print_rubies_one_zero
    p = Prospector.new(1, 1, 1)
    def p.ruby_form(num); 'ruby'; end
    assert_output ("\tFound 1 ruby in Pitt.\n") {p.print_rubies(1, 0, 'Pitt') }
  end

  # real_ruby != 0, fake_ruby != 0, ,method prints 'Found [real_ruby] real ruby (or rubies) and [fake_ruby] fake ruby (or rubies) in [location]
  def test_print_rubies_four_two
    p = Prospector.new(1, 1, 1)
    def p.ruby_form(num); 'rubies'; end
    assert_output ("\tFound 4 rubies and 2 fake rubies in Pitt.\n") {p.print_rubies(4, 2, 'Pitt') }
  end
end