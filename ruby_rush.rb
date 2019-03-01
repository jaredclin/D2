require_relative 'command_line'
require_relative 'prospector'

# Looks good!
# Just FYI - "rescue" by itself rescues StandardError
begin
  seed, num_prospectors, num_turns = CommandLine.return_values(ARGV)
rescue StandardError
  CommandLine.report_correct_usage
  exit 1
end

rush = Prospector.new(seed, num_prospectors, num_turns)
# Why not this -
# Now you don't have to test the entire program
# executing, you can test each one individuallhy
# and you can just pass in the seed etc. as an
# argument which will make your testing easier
(1..num_prospectors).each do |p|
  rush.run_one_iteration p, seed, num_turns
end
exit 0
  
