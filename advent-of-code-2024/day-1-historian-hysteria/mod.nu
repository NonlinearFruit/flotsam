const input_file = "day-1-historian-hysteria/input"

export def "part 1" [] {
  open $input_file
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

export def "part 2" [] {
  open $input_file
  | parse '{list_a}   {list_b}'
  | update list_a { into int }
  | update list_b { into int }
  | do {|it|
    let lookup = $it.list_b | uniq -c
    $it.list_a
    | each {|item|
      $item * ($lookup | where value == $item | get -i count.0 | default 0)
    }
  } $in
  | math sum
}
