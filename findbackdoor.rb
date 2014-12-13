require 'digest'
require 'yaml'

PATH = File.dirname(__FILE__)

require File.join(PATH, '/main/cmdline_parser')
require File.join(PATH, '/main/findbackdoor')
require File.join(PATH, '/main/report')
require File.join(PATH, '/main/color')

args = CmdLineParser.parse(ARGV)

if (args[:list_db])
  print_status("Available signatures:")
  Dir.glob(File.join("signatures","**","*.yml")).each do |db_name|
    print_good("#{db_name}")
  end
  exit
end

config = YAML.load_file(args[:db_name])
result = FindBackdoor.run(config, args[:source])
Report.generate(result, args[:report_format])
