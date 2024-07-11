export def main [] {
  let input = $in
  let tempFile = mktemp

  $input | save -f $tempFile
  ^$env.EDITOR $tempFile
  if not ($tempFile | path exists) {
    return null
  }
  let output = open --raw $tempFile
  rm -f $tempFile
  $output
}
