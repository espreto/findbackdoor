class Report

  def self.generate(result, format)
    case format
      when :xml
        xml(result)
      when :html
        html(result)
      else
        console(result)
      end
  end

  def self.xml(result)
    puts("Not implemented")
  end


  def self.html(result)
    puts("Not implemented")
  end

  def self.console(result)
    puts("=" * 80)
    puts("Signature: #{result[:database]}\nUpdated at: #{result[:database_updated_at]}")
    puts("Scanned files: #{result[:scanned_files]}")
    puts("Total issues: #{result[:total_issues]}")

    result[:tests].each do |key, value|
      puts("=" * 80)
      puts("[*] #{key}")
      puts("[*] References:")
      value[:references].each {|ref| puts "    #{ref}" }
      puts("[*] Issues found: #{value[:issues_found]}")
      puts("[*] Files:\n\n")
      value[:files].each do |file|
        puts("\t#{file[0]}")
        file[1].each do |issue|
          puts("\t#{issue[0]}: #{issue[1]}") #lineno: linecontent
        end
        puts
      end
    end
  end
end
