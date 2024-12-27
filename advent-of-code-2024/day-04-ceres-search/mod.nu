const input_file = "input"

export def "part 1" [] {
  open $input_file
  | lines
  | each {
    split row ''
    | where $it != ''
  }
  | xmas-count
}

export def "part 2" [] {
  let grid = open "day-04-ceres-search/input"
  | lines
  | each {
    split row ''
    | where $it != ''
  }
  let maxRow = $grid | length
  let maxColumn = $grid.0 | length

  let aIndices = $grid
  | enumerate
  | each {|it|
    $it.item
    | enumerate
    | insert row $it.index
    | rename --column { index: column }
  }
  | flatten
  | where item == 'A'
  | where row != 0
  | where column != 0
  | where row != ($maxRow - 1)
  | where column != ($maxColumn - 1)

  $aIndices
  | where {
    [
      (north-x-mas $grid $in)
      (south-x-mas $grid $in)
      (west-x-mas $grid $in)
      (east-x-mas $grid $in)
    ]
    | any { $in }
  }
  | length
}

def is-an-a [grid index] {
  $grid
  | at-index $index.row $index.column
  | $in == 'A'
}

def north-x-mas [grid index] {
  [
    ($grid | at-index ($index.row - 1) ($index.column - 1) | $in == 'M')
    ($grid | at-index ($index.row - 1) ($index.column + 1) | $in == 'M')
    ($grid | at-index ($index.row + 1) ($index.column - 1) | $in == 'S')
    ($grid | at-index ($index.row + 1) ($index.column + 1) | $in == 'S')
  ]
  | all { $in }
}

def south-x-mas [grid index] {
  [
    ($grid | at-index ($index.row - 1) ($index.column - 1) | $in == 'S')
    ($grid | at-index ($index.row - 1) ($index.column + 1) | $in == 'S')
    ($grid | at-index ($index.row + 1) ($index.column - 1) | $in == 'M')
    ($grid | at-index ($index.row + 1) ($index.column + 1) | $in == 'M')
  ]
  | all { $in }
}

def west-x-mas [grid index] {
  [
    ($grid | at-index ($index.row - 1) ($index.column - 1) | $in == 'M')
    ($grid | at-index ($index.row - 1) ($index.column + 1) | $in == 'S')
    ($grid | at-index ($index.row + 1) ($index.column - 1) | $in == 'M')
    ($grid | at-index ($index.row + 1) ($index.column + 1) | $in == 'S')
  ]
  | all { $in }
}

def east-x-mas [grid index] {
  [
    ($grid | at-index ($index.row - 1) ($index.column - 1) | $in == 'S')
    ($grid | at-index ($index.row - 1) ($index.column + 1) | $in == 'M')
    ($grid | at-index ($index.row + 1) ($index.column - 1) | $in == 'S')
    ($grid | at-index ($index.row + 1) ($index.column + 1) | $in == 'M')
  ]
  | all { $in }
}

export def at-index [row column] {
  get $row | get $column
}

export def xmas-count [] {
  flatten-grid
  | str replace --all 'XMAS' 'X1S'
  | str replace --all 'SAMX' 'S1X'
  | split row ''
  | where $it == '1'
  | length
}

export def flatten-grid [] {
  let grid = $in
  $grid
  | each { append "." }
  | append [($grid.0 | each { "." } | append ".")]
  | [
    ($in | join-by-row)
    ($in | join-by-column)
    ($in | join-by-backslash)
    ($in | join-by-forwardslash)
  ]
  | each { str join "" }
  | str join "."
}

def join-by-row [] {
  each { str join "" }
}

def join-by-column [] {
  each {enumerate}
  | flatten
  | group-by index
  | transpose index item
  | each { get item | get item | str join "" }
  | where $it != ""
}

export def join-by-backslash [] {
  let grid = $in
  let maxColumns = $grid | get 0 | length
  let maxRows = $grid | length
  let maxSide = [$maxRows $maxColumns] | math max
  let maxIndex = ($maxSide * $maxSide) - 1
  0..$maxIndex
  | each {
    $in * ($maxSide + 1)
    | [
      ($in mod $maxSide)
      ($in // $maxSide | $in mod $maxSide)
    ]
  }
  | where $it.0 < $maxRows and $it.1 < $maxColumns
  | each {|it| $grid | get $it.0 | get $it.1 }
}

export def join-by-forwardslash [] {
  let grid = $in
  let maxColumns = $grid | get 0 | length
  let maxRows = $grid | length
  let maxSide = [$maxRows $maxColumns] | math max
  let maxIndex = ($maxSide * $maxSide) - 1
  0..$maxIndex
  | each {
    $in * ($maxSide - 1)
    | [
      ($in mod $maxSide)
      ($in // $maxSide | $in mod $maxSide)
    ]
  }
  | where $it.0 < $maxRows and $it.1 < $maxColumns
  | each {|it| $grid | get $it.0 | get $it.1 }
}
