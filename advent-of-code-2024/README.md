
# Advent of Code 2024

[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/NonlinearFruit/advent-of-code-2024/master)](https://github.com/NonlinearFruit/advent-of-code-2024/commits/master/)
[![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/NonlinearFruit/advent-of-code-2024/test.yml?label=tests)](https://github.com/NonlinearFruit/advent-of-code-2024/actions/workflows/test.yml)
![star count](https://img.shields.io/badge/stars-6-yellow)
![test count](https://img.shields.io/badge/tests-0-blue)

```

          .-----.          .------------------.         
       .--'~ ~ ~|        .-' *       \  /     '-.   1 **
    .--'~  ,* ~ |        |  >o<   \_\_\|_/__/   |   2 **
.---': ~ '(~), ~|        | >@>O< o-_/.()__------|   3 **
|               |        |                      |   4 
|               |        |          ..          |   5 
|               |        |        .'  '.        |   6 
|               |        |        |    |        |   7 
|   .--.        |        |        |    |        |   8 
'---'  |        |        |        |    |        |   9 
       |        |        |        |    |        |  10 
       |        |        |        |    |        |  11 
       |        |        |        |    |        |  12 
       |        |        |        |    |        |  13 
                                                   14
                                                   15
                                                   16
                                                   17
                                                   18
                                                   19
                                                   20
                                                   21
                                                   22
                                                   23
                                                   24
                                                   25

```

# Prerequisites

```
cargo install nushell # https://github.com/nushell/nushell
cargo install aoc-cli # https://github.com/scarvalhojr/aoc-cli
vim ~/.adventofcode.session # https://github.com/scarvalhojr/aoc-cli?tab=readme-ov-file#session-cookie
```

# Usage

<details>
<summary>
nu -c 'use toolkit.nu; toolkit pull puzzle'
</summary>

```
Download the puzzle input and description

Usage:
  > pull puzzle <day> 

Flags:
  -h, --help: Display the help message for this command

Parameters:
  day <int>

Input/output types:
  ╭───┬───────┬────────╮
  │ # │ input │ output │
  ├───┼───────┼────────┤
  │ 0 │ any   │ any    │
  ╰───┴───────┴────────╯


```
</details>

<details>
<summary>
nu -c 'use toolkit.nu; toolkit run puzzle'
</summary>

```
Run a puzzle solver

Usage:
  > run puzzle <day> 

Flags:
  -h, --help: Display the help message for this command

Parameters:
  day <int>

Input/output types:
  ╭───┬───────┬────────╮
  │ # │ input │ output │
  ├───┼───────┼────────┤
  │ 0 │ any   │ any    │
  ╰───┴───────┴────────╯


```
</details>

<details>
<summary>
nu -c 'use toolkit.nu; toolkit submit answer'
</summary>

```
Submit an answer to a puzzle

Usage:
  > submit answer <day> 

Flags:
  -h, --help: Display the help message for this command

Parameters:
  day <int>

Input/output types:
  ╭───┬───────┬────────╮
  │ # │ input │ output │
  ├───┼───────┼────────┤
  │ 0 │ any   │ any    │
  ╰───┴───────┴────────╯


```
</details>

<details>
<summary>
nu -c 'use toolkit.nu; toolkit update readme'
</summary>

```
Recalculate the README

Usage:
  > update readme 

Flags:
  -h, --help: Display the help message for this command

Input/output types:
  ╭───┬───────┬────────╮
  │ # │ input │ output │
  ├───┼───────┼────────┤
  │ 0 │ any   │ any    │
  ╰───┴───────┴────────╯


```
</details>

## Nushell v0.100.0: Lessons Learned

- On day 2, when piping into an `if`, could not call a defined function in the `else` clause. The error was something like `variable not defined` but the stacktrace was a couple functions higher than the `else` clause

# Links

- [Awesome Advent of Code](https://github.com/Bogdanp/awesome-advent-of-code) 
- [Reference when blocked](https://github.com/jromero132/advent-of-code) 
