const input_file = "day-02-red-nosed-reports/input"

export def "part 1" [] {
  parsed_input
  | where (is_sorted)
  | where (is_valid)
  | length
}

export def "part 2" [] {
  parsed_input
  | where (is_tolerable)
  | length
}

def parsed_input [] {
  open $input_file
  | lines
  | par-each { split words | into int } 
}

def is_sorted [] {
  ($in | sort --reverse) == $in or ($in | sort) == $in
}

def is_valid [] {
  window 2
  | all {|w|
    $w.0 - $w.1
    | math abs
    | $in in 1..3
  }
}

def is_tolerable [] {
  sublists_with_one_missing $in
  | where (is_sorted)
  | where (is_valid)
  | is-not-empty
}

def sublists_with_one_missing [list] {
  $list
  | length
  | 0..<($in)
  | each {|i| $list | reject $i }
}
