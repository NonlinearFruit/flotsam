const input_file = "day-03-mull-it-over/input"

export def "part 1" [] {
  open $input_file
  | parse_multiply_sum
}

export def "part 2" [] {
  open $input_file
  | lines
  | str join ''
  | str replace --all -r "don't\\(\\)(|\\s).*?(do\\(\\)|$)" ''
  | parse_multiply_sum
}

def parse_multiply_sum [] {
  parse -r 'mul\((?<a>\d+),(?<b>\d+)\)'
  | update a { into int }
  | update b { into int }
  | each { $in.a * $in.b }
  | math sum
}
