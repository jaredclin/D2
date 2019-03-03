require_relative 'command_line'
require_relative 'prospector'

begin
  seed, num_prospectors, num_turns = CommandLine.return_values(ARGV)
rescue StandardError
  CommandLine.report_correct_usage
  exit 1
end

exit 0 if num_turns.zero?

rush = Prospector.new(seed, num_prospectors, num_turns)

(1..num_prospectors).each do |p|
  rush.run_one_iteration p, num_turns
end
exit 0
