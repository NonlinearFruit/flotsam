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
  | par-each {|index|
    let nw = $grid | at-index ($index.row - 1) ($index.column - 1)
    let ne = $grid | at-index ($index.row - 1) ($index.column + 1)
    let sw = $grid | at-index ($index.row + 1) ($index.column - 1)
    let se = $grid | at-index ($index.row + 1) ($index.column + 1)
    (
      (north-x-mas $nw $ne $sw $se)
      or (south-x-mas $nw $ne $sw $se)
      or (west-x-mas $nw $ne $sw $se)
      or (east-x-mas $nw $ne $sw $se)
    )
  }
  | where $it
  | length
}

def north-x-mas [nw ne sw se] {
  (
    ($nw == 'M')
    and ($ne == 'M')
    and ($sw == 'S')
    and ($se == 'S')
  )
}

def south-x-mas [nw ne sw se] {
  (
    ($nw == 'S')
    and ($ne == 'S')
    and ($sw == 'M')
    and ($se == 'M')
  )
}

def west-x-mas [nw ne sw se] {
  (
    ($nw == 'M')
    and ($ne == 'S')
    and ($sw == 'M')
    and ($se == 'S')
  )
}

def east-x-mas [nw ne sw se] {
  (
    ($nw == 'S')
    and ($ne == 'M')
    and ($sw == 'S')
    and ($se == 'M')
  )
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
