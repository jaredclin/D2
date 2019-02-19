# Class to confirm that command line arguments are valid
class CommandLine
  def report_correct_usage
    puts 'Usage:'
    puts 'ruby gold_rush.rb *seed* *num_prospectors* *num_turns*'
    puts '*seed* should be an integer'
    puts '*num_prospectors* should be a non-negative integer'
    puts '*num_turns* should be a non-negative integer'
  end

  def not_three_arguments
    return 1 if ARGV.length != 3
  end

  def not_integers
    return 1 if !/\A[-+]?\d+\z/.match(ARGV[0]) || !/\A[-+]?\d+\z/.match(ARGV[1]) || !/\A[-+]?\d+\z/.match(ARGV[2])
  end

  def negative_integers
    return 1 if !/\A\d+\z/.match(ARGV[1]) || !/\A\d+\z/.match(ARGV[2])
  end

  def seed
    ARGV[0].to_i
  end

  def number_of_prospectors
    ARGV[1].to_i
  end

  def number_of_turns
    ARGV[2].to_i
  end
end
