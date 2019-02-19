require_relative 'command_line'

begin
  seed, num_prospectors, num_turns = CommandLine.initialize(ARGV)
rescue StandardError
  CommandLine.report_correct_usage
  exit 1
end

