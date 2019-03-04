# Class to confirm that command line arguments are valid
class CommandLine
  def self.return_values(arr)
    raise 'CountError' if arr.count != 3

    seed, num_prospectors, num_turns = arr

    raise 'SeedError' unless /\A[-+]?\d+\z/=~seed

    raise 'NumProspectorError' unless /\A\d+\z/=~num_prospectors

    raise 'NumTurnsError' unless /\A\d+\z/=~num_turns

    [seed.to_i, num_prospectors.to_i, num_turns.to_i]
  end

  def self.report_correct_usage
    puts 'Usage:'
    puts 'ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*'
    puts '*seed* should be an integer'
    puts '*num_prospectors* should be a non-negative integer'
    puts '*num_turns* should be a non-negative integer'
  end
end
