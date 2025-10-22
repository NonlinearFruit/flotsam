const input_file = "day-02-red-nosed-reports/input"

export def "part 1" [] {
  parsed-input
  | where (is_sorted)
  | where (is_valid)
  | length
}

export def "part 2" [] {
  parsed-input
  | where (is_tolerable)
  | length
}

def parsed-input [] {
  open $input_file
  | lines
  | par-each { split words | into int } 
}

def is_sorted [] {
  ($in | sort -r) == $in or ($in | sort) == $in
}

def is_valid [] {
  $in
  | window 2
  | all {|w|
    $w.0 - $w.1 | math abs | 0 < $in and $in < 4
  }
}

def is_tolerable [] {
  let list = $in
  0..<($list | length)
  | each { |i| $list | reject $i }
  | where (is_sorted)
  | where (is_valid)
  | is-not-empty
}
