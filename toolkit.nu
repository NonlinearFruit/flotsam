#!/usr/bin/env nu

def --wrapped main [...rest] {
  const pathToSelf = path self
  let nameOfSelf = $pathToSelf | path parse | get stem
  if $rest in [ [-h] [--help] ] {
    ^$nu.current-exe -c $'use ($pathToSelf); scope modules | where name == ($nameOfSelf) | get 0.commands.name'
  } else {
    ^$nu.current-exe -c $'use ($pathToSelf); ($nameOfSelf) ($rest | str join (" "))'
  }
}

export def absorb [clone_url] {
  let remote = "other-origin"
  let monorepo_dir = pwd
  let clone_location = mktemp --directory
  let clone_name = $clone_url | parse --regex ".*/(?<name>[^/]+).git" | get 0.name

  ^git remote remove $remote | complete
  ^git clone --quiet $clone_url $clone_location
  print $"Cloned '($clone_url)' into '($clone_location)'"
  cd $clone_location
  ^git filter-repo --to-subdirectory-filter $clone_name | complete
  print $"Moved all commits into ($clone_name)/"
  cd $monorepo_dir
  ^git remote add $remote $clone_location
  ^git fetch --quiet $remote
  rm -rf $clone_location
  ^git merge --quiet --no-ff --allow-unrelated-histories --no-edit $'($remote)/master'
  | complete
  | if $in.exit_code != 0 {
    print $in
    exit 1
  }
  print $"Merged into flotsam!"
  ^git remote remove $remote | complete | ignore
}

export def update-readme [] {
  ls
  | where type == dir
  | get name
  | each {|dir|
    {
      project: $dir
      last-commit: (^git log --date=format:%Y-%m-%d --format=%ad $dir | lines | first)
    }
  }
  | to md
  | $"
> n. _floating wreckage of a ship or its cargo_

On the sea for dreams and aspirations, this repo contains the remains of the
projects that didn't make it.

($in)
"
  | save -f README.md
}
