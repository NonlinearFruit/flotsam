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

  print $clone_name
  ^git remote remove $remote | complete
  ^git clone --quiet $clone_url $clone_location
  cd $clone_location
  ^git filter-repo --to-subdirectory-filter $clone_name | complete
  cd $monorepo_dir
  ^git remote add $remote $clone_location
  ^git fetch --quiet $remote
  rm -rf $clone_location
  ^git merge -q --no-ff --allow-unrelated-histories --no-edit $'($remote)/master'
  | complete
  | if $in.exit_code != 0 {
    print $in
    print "Merge failed!"; exit 1
  }
  ^git remote remove $remote | complete
  print 'Done!'
}

def add-repo [monorepo_dir remote clone_url] {
  # cd ..
  # let full_path = pwd | path join ($repo | to-path)
  # if ($full_path | path exists) {
  #   rm -rf $full_path
  # }
  # print $'Setting up ($full_path)'
  # ^git clone -q $'git@gitlab.com:($repo).git' ($repo | to-path)
  # cd $full_path
  # ^git-filter-repo --to-subdirectory-filter ($repo | to-path) | complete
  # cd $monorepo_dir
  # ^git remote add $repo $full_path
  # ^git fetch -q $repo
  # ^git switch -q master
  # ^git-pair.nu -c merge.suppressDest='*' merge -q --no-ff --allow-unrelated-histories --no-edit $'($repo)/master' | complete | if $in.exit_code != 0 { print "Merge failed!"; exit 1 }
  # ^git remote remove $repo
}
