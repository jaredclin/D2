require_relative 'command_line'

cl = CommandLine.new
if cl.not_three_arguments || cl.not_integers || cl.negative_integers
  cl.report_correct_usage
  exit 1
end
