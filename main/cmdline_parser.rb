#
# FindBackdoor.rb
#
class CmdLineParser
  def self.parse(_args)
    options = {}
    options[:list_db] = false
    options[:report_format] = :console
    optparse = OptionParser.new do |opts|
      opts.on('-s', '--source <dir>', 'Directory containing the source code') do |source|
        options[:source] = source
      end
      opts.on('-d', '--db <signatures>', 'Patterns signatures') do |db_name|
        options[:db_name] = db_name
      end
      opts.on('-r', '--report <format>', 'Report format <console|xml|html>') do |report_format|
        options[:report_format] = report_format
      end
      opts.on('-l', '--list', 'List available signatures') do
        options[:list_db] = true
      end
      opts.on('-h', '--help', 'Show this menu') do
        print_status("#{opts}")
        exit
      end
    end

    begin
      optparse.parse!
      unless options[:list_db]
        if !options.include?(:source) || !options.include?(:db_name)
          print_error('-s or -d missing')
          print_status("#{optparse}")
          exit
        end
      end
      options
    rescue OptionParser::InvalidOption, OptionParser::MissingArgument => e
      print_error("Error: #{e}")
      exit
    end
  end
end
