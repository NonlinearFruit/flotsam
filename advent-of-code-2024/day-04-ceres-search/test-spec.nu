export def "test part 1" [] {
  use std assert
  use mod.nu *

  assert equal 2458 (part 1)
}

export def "test part 2" [] {
  use std assert
  use mod.nu *

  part 2
  | assert equal 1945 $in
}

export def "test xmas count with basic example" [] {
  use std assert
  use mod.nu *
  let result = [
    "..X..."
    ".SAMX."
    ".A..A."
    "XMAS.S"
    ".X...."
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | xmas-count

  assert equal 4 $result
}

export def "test xmas count with full example with noise" [] {
  use std assert
  use mod.nu *
  let result = [
    "MMMSXXMASM"
    "MSAMXMSMSA"
    "AMXSXMAAMM"
    "MSAMASMSMX"
    "XMASAMXAMM"
    "XXAMMXXAMA"
    "SMSMSASXSS"
    "SAXAMASAAA"
    "MAMMMXMMMM"
    "MXMXAXMASX"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | xmas-count

  assert equal 18 $result
}

export def "test xmas count with full example without noise" [] {
  use std assert
  use mod.nu *
  let result = [
    "....XXMAS."
    ".SAMXMS..."
    "...S..A..."
    "..A.A.MS.X"
    "XMASAMX.MM"
    "X.....XA.A"
    "S.S.S.S.SS"
    ".A.A.A.A.A"
    "..M.M.M.MM"
    ".X.X.XMASX"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | xmas-count

  assert equal 18 $result
}

export def "test flattened grid has rows" [] {
  use std assert
  use mod.nu *
  let result = [
    "abc"
    "def"
    "ghi"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | flatten-grid
  assert ($result =~ '\babc\b')
  assert ($result =~ '\bdef\b')
  assert ($result =~ '\bghi\b')
}

export def "test flattened grid has columns" [] {
  use std assert
  use mod.nu *
  let result = [
    "abc"
    "def"
    "ghi"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | flatten-grid
  assert ($result =~ '\badg\b')
  assert ($result =~ '\bbeh\b')
  assert ($result =~ '\bcfi\b')
}

export def "test flattened grid has backslashes" [] {
  use std assert
  use mod.nu *

  let result = [
    "abc"
    "def"
    "ghi"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | flatten-grid

  assert ($result =~ '\baei\b') "No aei"
  assert ($result =~ '\bbf\b') "No bf"
  assert ($result =~ '\bdh\b') "No dh"
  assert ($result =~ '\bg\b') "No g"
  assert ($result =~ '\bc\b') "No c"
}

export def "test flattened grid has forwardslashes" [] {
  use std assert
  use mod.nu *

  let result = [
    "abc"
    "def"
    "ghi"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | flatten-grid

  assert ($result =~ '\bgec\b') "No gec"
  assert ($result =~ '\bhf\b') "No hf"
  assert ($result =~ '\bdb\b') "No db"
  assert ($result =~ '\ba\b') "No a"
  assert ($result =~ '\bi\b') "No i"
}

export def "test join by backslash" [] {
  use std assert
  use mod.nu *

  let result = [
    "abc"
    "def"
    "ghi"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | each { append "." }
  | append [($in.0 | each { "." })]
  | join-by-backslash
  | str join ""

  assert equal "aei.bf..c.g..dh." $result
}

export def "test join by backslash when columns are bigger than rows" [] {
  use std assert
  use mod.nu *

  let result = [
    "abc"
    "def"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | each { append "." }
  | append [($in.0 | each { "." })]
  | join-by-backslash
  | str join ""

  assert equal "ae.bf.c...d." $result
}

export def "test join by backslash when rows are bigger than columns" [] {
  use std assert
  use mod.nu *

  let result = [
    "ab"
    "de"
    "gh"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | each { append "." }
  | append [($in.0 | each { "." })]
  | join-by-backslash
  | str join ""

  assert equal "ae.b...g.dh." $result
}

export def "test join by forwardslash" [] {
  use std assert
  use mod.nu *

  let result = [
    "abc"
    "def"
    "ghi"
  ]
  | each {
    split row ''
    | where $it != ''
  }
  | each { append "." }
  | append [($in.0 | each { "." })]
  | join-by-forwardslash
  | str join ""

  assert equal "a.hf..gec..db.i." $result
}
