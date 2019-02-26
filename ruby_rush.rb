require_relative 'command_line'
require_relative 'prospector'

begin
  seed, num_prospectors, num_turns = CommandLine.return_values(ARGV)
rescue StandardError
  CommandLine.report_correct_usage
  exit 1
end

rush = Prospector.new(seed, num_prospectors, num_turns)
rush.run_program
exit 0
  