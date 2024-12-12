const input_file = "day-2-red-nosed-reports/input"

export def "part 1" [] {
  open $input_file
  | lines
  | each { split row ' ' | each { into int } }
  | each {|report|
    process_report $report
    | {
      result: $in
      report: ($report | str join ' ')
    }
  }
  | where result
  | length
}

export def "part 2" [] {
  open $input_file
  | lines
  | each { split row ' ' | each { into int } }
  | each {|report|
    hardened_process_report $report
    | {
      result: $in
      report: ($report | str join ' ')
    }
  }
  | where result
  | length
}

def hardened_process_report [report] {
  $report
  | all_sublists_of_length_n_minus_1
  | each {|list|
    process_report $list
  }
  | sort --reverse
  | first
}

def process_report [report] {
  let next = $report | first
  $report
  | range 1..
  | do {|it|
    let down = $it | going_down $next
    let up = $it | going_up $next
    $up or $down
  } $in
}

def going_up [previous] {
  let list = $in
  if ($list | is-empty) { return true }
  let next = $list | first
  $list
  | range 1..
  | if $previous < $next and $next < $previous + 4 {
    going_up $next
  } else {
    false
  }
}

def going_down [previous] {
  let list = $in
  if ($list | is-empty) { return true }
  let next = $list | first
  $list
  | range 1..
  | if $previous > $next and $next > $previous - 4 {
    going_down $next
  } else {
    false
  }
}

def all_sublists_of_length_n_minus_1 [] {
  do {|list|
    $list
    | length
    | 1..$in
    | each {|i|
      ($list | take ($i - 1)) ++ ($list | skip $i)
    }
  } $in
}
