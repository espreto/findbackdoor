class FindBackdoor
  def self.run(db, source_dir)

    files = get_filenames(db[:extensions], source_dir)

    result = {}
    result[:database] = db[:database][:name]
    #result[:database_version] = db[:database][:version]
    result[:database_updated_at] = db[:database][:updated_at]
    result[:scanned_files] = files.length
    result[:total_issues] = 0
    result[:tests] = {}

    db[:tests].each do |test|

      result[:tests][test[:title]] = {}
      result[:tests][test[:title]][:references] = test[:references]
      result[:tests][test[:title]][:files] = []
      result[:tests][test[:title]][:issues_found] = 0

      test[:patterns].each do |pattern|
        files.each do |f|
          match_lines = []
          lines = File.open(f, "r:iso-8859-1").readlines
          lines.each_with_index do |line, lineno|
            match_lines << [lineno + 1, line.squeeze(" \t")] if (line =~ pattern)
          end
          if (match_lines.length > 0)
            result[:tests][test[:title]][:files] << [f, match_lines]
            result[:total_issues] += match_lines.length
            result[:tests][test[:title]][:issues_found] += match_lines.length
          end
        end
      end
      result[:tests].delete(test[:title]) if (result[:tests][test[:title]][:files].length == 0)
    end
    result
  end

  def self.get_filenames(extensions, directory)
    files = []
    extensions.each do |ext|
      files << Dir.glob(File.join(directory,"**","*.#{ext}"), File::FNM_CASEFOLD).flatten
    end
    files.flatten
  end
end
