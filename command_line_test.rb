require 'minitest/autorun'
require_relative 'command_line'

# UNIT TESTS FOR CLASS CommandLine
class CommandLineTest < Minitest::Test

  # UNIT TEST FOR METHOD report_correct_usage
  def test_report_correct_usage
    assert_output("Usage:\nruby gold_rush.rb *seed* *num_prospectors* *num_turns*\n*seed* should be an integer\n*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer\n") { CommandLine.report_correct_usage }
  end

  # UNIT TESTS FOR METHOD initialize

  # UNIT TESTS FOR Number Of Inputs
  # Equivalence classes:
  # x = 3 -> valid
  # x != 3 -> invalid

  # if array length is not 3, CountError is reported
  def test_initialize_two_arguments
    assert_raises 'CountError' do
      CommandLine.new(['1', '2'])
    end
  end

  # if array length is 3, no error is reported
  def test_initialize_three_arguments
    !assert_raises 'CountError' do
      CommandLine.new(['1', '2', '3'])
    end
  end

  # UNIT TESTS FOR Seed Check
  # Equivalence classes:
  # x = int -> valid
  # x != int -> invalid

  # if x is a positive integer, no error is reported
  def test_initialize_positive_seed
    !assert_raises 'SeedError' do
      CommandLine.new(['1', '1', '1'])
    end
  end

  # if x is a negative integer, no error is reported
  def test_initialize_negative_seed
    !assert_raises 'SeedError' do
      CommandLine.new(['-1', '1', '1'])
    end
  end

  # if an invalid value, such as a string, is given for x, SeedError is reported
  # EDGE CASE
  def test_initialize_non_integer_seed
    assert_raises 'SeedError' do
      CommandLine.new(['one', '1', '1'])
    end
  end

  # UNIT TESTS FOR Seed Check
  # Equivalence classes:
  # x = int -> valid
  # x != int -> invalid

  # if x is a positive integer, no error is reported
  def test_initialize_positive_seed
    !assert_raises 'SeedError' do
      CommandLine.new(['1', '1', '1'])
    end
  end

  # if x is a negative integer, no error is reported
  def test_initialize_negative_seed
    !assert_raises 'SeedError' do
      CommandLine.new(['-1', '1', '1'])
    end
  end

  # if an invalid value, such as a string, is given for x, SeedError is reported
  # EDGE CASE
  def test_initialize_non_integer_seed
    assert_raises 'SeedError' do
      CommandLine.new(['one', '1', '1'])
    end
  end

  # UNIT TESTS FOR Seed Check
  # Equivalence classes:
  # x = int -> valid
  # x != int -> invalid

  # if x is a positive integer, no error is reported
  def test_initialize_positive_seed
    !assert_raises 'SeedError' do
      CommandLine.new(['1', '1', '1'])
    end
  end

  # if x is a negative integer, no error is reported
  def test_initialize_negative_seed
    !assert_raises 'SeedError' do
      CommandLine.new(['-1', '1', '1'])
    end
  end

  # if an invalid value, such as a string, is given for x, SeedError is reported
  # EDGE CASE
  def test_initialize_non_integer_seed
    assert_raises 'SeedError' do
      CommandLine.new(['one', '1', '1'])
    end
  end
end
