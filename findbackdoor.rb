require 'digest'
require 'yaml'

PATH = File.dirname(__FILE__)

require File.join(PATH, '/main/cmdline_parser')
require File.join(PATH, '/main/findbackdoor')
require File.join(PATH, '/main/report')

args = CmdLineParser.parse(ARGV)

if (args[:list_db])
  puts("[*] Available signatures:")
  Dir.glob(File.join("signatures","**","*.yml")).each do |db_name|
    puts("[+] - #{db_name}")
  end
  #puts
  exit
end

config = YAML.load_file(args[:db_name])
result = FindBackdoor.run(config, args[:source])
Report.generate(result, args[:report_format])
