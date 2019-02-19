require 'minitest/autorun'
require_relative 'command_line'

# UNIT TESTS FOR CLASS CommandLine
class CommandLineTest < Minitest.Test
  # UNIT TEST FOR METHOD report_correct_usage
  # *** line too long
  def test_print_correct_usage
    cl = CommandLine.new
    assert_output("Usage:\nruby gold_rush.rb *seed* *num_prospectors* *num_turns*\n*seed* should be an integer\n*num_prospectors* should be a non-negative integer\n*num_turns* should be a non-negative integer\n") { cl.report_correct_usage }
  end
  
  # ARGV?
end
