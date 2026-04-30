export def "test input data is successfully output" [] {
  use std assert
  use vipe.nu
  let input = "piped data to edit"

  with-env { EDITOR: "touch" } {
    let output = $input | vipe
    assert equal $input $output
  }
}

export def "test output data is modified by EDITOR" [] {
  use std assert
  use vipe.nu
  let input = "piped data to edit"

  with-env { EDITOR: "rm" } {
    let output = $input | vipe
    assert equal null $output
  }
}
