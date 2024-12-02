const input_file = "day-1-historian-hysteria/input"

export def "part 1" [] {
  open day-1-historian-hysteria/input
  | parse '{list_a}   {list_b}'
  | update list_a { into int }
  | update list_b { into int }
  | do {|it|
    $it.list_a
    | sort
    | zip ($it.list_b | sort)
  } $in
  | each {|pair| $pair.0 - $pair.1}
  | math abs
  | math sum
}

export def "part 1 debug" [] {
  open $input_file
}

export def "part 2" [] {
  open $input_file
}

export def "part 2 debug" [] {
  open $input_file
}
