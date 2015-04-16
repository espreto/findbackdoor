#
# FindBackdoor.rb
#
require 'digest'
require 'yaml'
require 'optparse'
require_relative 'main/findbackdoor'
require_relative 'main/cmdline_parser'
require_relative 'main/report'
require_relative 'main/color'

include Colorize

args = CmdLineParser.parse(ARGV)

if args[:list_db]
  print_status('Available signatures:')
  Dir.glob(File.join('signatures', '**', '*.yml')).each do |db_name|
    print_good("#{db_name}")
  end
  exit
end

config = YAML.load_file(args[:db_name])
result = FindBackdoor.run(config, args[:source])
Report.generate(result, args[:report_format])
