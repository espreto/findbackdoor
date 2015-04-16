#
# FindBackdoor.rb
#
module Colorize
  def print_error(msg = '')
    print_line("\e[31m[-]\e[0m #{msg}")
  end

  def print_good(msg = '')
    print_line("\e[32m[+]\e[0m #{msg}")
  end

  def print_warning(msg = '')
    print_line("\e[33m[!]\e[0m #{msg}")
  end

  def print_status(msg = '')
    print_line("\e[34m[*]\e[0m #{msg}")
  end

  def print_debug(msg = '')
    print_line("\e[36m[!]\e[0m #{msg}")
  end

  def print_line(msg = '')
    print(msg + "\n")
  end

  def print_div(msg = '')
    print('=*' * 8 + "\n")
  end
end
