def print_error(msg = '')
  print_line("\033[31m[-]\033[0m #{msg}")
end

def print_good(msg = '')
  print_line("\033[32m[+]\033[0m #{msg}")
end

def print_debug(msg = '')
  print_line("\033[36m[!]\033[0m #{msg}")
end

def print_status(msg = '')
  print_line("\033[34m[*]\033[0m #{msg}")
end

def print_line(msg = '')
  print(msg + "\n")
end
