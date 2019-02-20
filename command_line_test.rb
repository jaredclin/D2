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
      CommandLine.return_values(['1', '2'])
    end
  end

  # if array length is 3, no error is reported
  def test_initialize_three_arguments
    refute_raises 'CountError' do
      CommandLine.return_values(['1', '2', '3'])
    end
  end

  # UNIT TESTS FOR Seed
  # Equivalence classes:
  # x = int -> valid
  # x != int -> invalid

  # if x is a positive integer, no error is reported
  def test_initialize_positive_seed
    refute_raises 'SeedError' do
      CommandLine.return_values(['1', '1', '1'])
    end
  end

  # if x is a negative integer, no error is reported
  def test_initialize_negative_seed
    refute_raises 'SeedError' do
      CommandLine.return_values(['-1', '1', '1'])
    end
  end

  # if an invalid value, such as a string, is given for x, SeedError is reported
  # EDGE CASE
  def test_initialize_non_integer_seed
    assert_raises 'SeedError' do
      CommandLine.return_values(['one', '1', '1'])
    end
  end

  # UNIT TESTS FOR Num_prospectors
  # Equivalence classes:
  # x >= 0 -> valid
  # x < 0 -> invalid
  # x != int -> invalid

  # if x is a positive integer, no error is reported
  def test_initialize_positive_num_prospectors
    refute_raises 'NumProspectorError' do
      CommandLine.return_values(['1', '1', '1'])
    end
  end

  # if x is 0, no error is reported
  # EDGE CASE
  def test_initialize_zero_num_prospectors
    refute_raises 'NumProspectorError' do
      CommandLine.return_values(['1', '0', '1'])
    end
  end

  # if x is a negative integer, NumProspectorError is reported
  def test_initialize_negative_num_prospectors
    assert_raises 'NumProspectorError' do
      CommandLine.return_values(['1', '-1', '1'])
    end
  end

  # if an invalid value, such as a string, is given for x, NumProspectorError is reported
  # EDGE CASE
  def test_initialize_non_integer_num_prospectors
    assert_raises 'NumProspectorError' do
      CommandLine.return_values(['1', 'one', '1'])
    end
  end

  # UNIT TESTS FOR Num_turns
  # Equivalence classes:
  # x >= 0 -> valid
  # x < 0 -> invalid
  # x != int -> invalid

  # if x is a positive integer, no error is reported
  def test_initialize_positive_num_turns
    refute_raises 'NumTurnsError' do
      CommandLine.return_values(['1', '1', '1'])
    end
  end

  # if x is 0, no error is reported
  # EDGE CASE
  def test_initialize_zero_num_turns
    refute_raises 'NumTurnsError' do
      CommandLine.return_values(['1', '1', '0'])
    end
  end

  # if x is a negative integer, NumProspectorError is reported
  def test_initialize_negative_num_turns
    assert_raises 'NumTurnsError' do
      CommandLine.return_values(['1', '1', '-1'])
    end
  end

  # if an invalid value, such as a string, is given for x, NumProspectorError is reported
  # EDGE CASE
  def test_initialize_non_integer_num_turns
    assert_raises 'NumTurnsError' do
      CommandLine.return_values(['1', '1', 'one'])
    end
  end
end
