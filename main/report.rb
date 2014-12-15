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
    print_div
    print_error("Not implemented")
  end

  def self.html(result)
    print_div
    print_error("Not implemented")
  end

  def self.console(result)
    print_div
    print_status("Signature: #{result[:database]}")
    print_status("Updated at: #{result[:database_updated_at]}")
    print_status("Scanned files: #{result[:scanned_files]}")
    print_status("Total issues: #{result[:total_issues]}")

    result[:tests].each do |key, value|
      print_div
      print_status("#{key}")
      print_status("References: #{value[:references][0]}")
      print_good("Issues found: #{value[:issues_found]}")
      print_status("Files:\n")
      value[:files].each do |file|
        print_line("\t#{file[0]}")
        file[1].each do |issue|
          print_line("\t#{issue[0]}: #{issue[1]}")
        end
      end
    end
  end
end
