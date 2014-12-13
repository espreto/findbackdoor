require 'optparse'

class CmdLineParser
  def self.parse(args)
    options = {}
    options[:list_db] = false
    options[:report_format] = :console
    optparse = OptionParser.new do |opts|
      opts.on("-s", "--source <dir>", "Directory containing the source code") do |source|
        options[:source] = source
      end
      opts.on("-d", "--db <signatures>", "Patterns signatures") do |db_name|
        options[:db_name] = db_name
      end
      opts.on("-r", "--report <format>", "Report format <console|xml|html>") do |report_format|
        options[:report_format] = report_format
      end
      opts.on("-l", "--list", "List available signatures") do
        options[:list_db] = true
      end
      opts.on("-h", "--help", "Show this menu") do
        puts("#{opts}")
        exit
      end
    end

    begin
      optparse.parse!
      if (!options[:list_db])
        if (!options.include?(:source) || !options.include?(:db_name))
          puts("\n -s or -d missing\n\n")
          puts(" #{optparse}\n")
          exit
        end
      end
      options
    rescue OptionParser::InvalidOption, OptionParser::MissingArgument => e
      puts("Error: #{e}")
      exit
    end
  end
end
