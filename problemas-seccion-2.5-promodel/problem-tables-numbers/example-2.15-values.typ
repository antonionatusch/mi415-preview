#import "number-tables-utils.typ": *

#let example_2_15_values = (
  0.34,
  0.83,
  0.96,
  0.47,
  0.79,
  0.99,
  0.37,
  0.72,
  0.06,
  0.18,
  0.67,
  0.62,
  0.05,
  0.49,
  0.59,
  0.42,
  0.05,
  0.02,
  0.74,
  0.67,
  0.46,
  0.22,
  0.99,
  0.78,
  0.39,
  0.18,
  0.75,
  0.73,
  0.79,
  0.29,
  0.11,
  0.19,
  0.58,
  0.34,
  0.42,
  0.37,
  0.31,
  0.73,
  0.74,
  0.21,
)


#let example_2_15_values_table() = {
  set text(size: 12pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..example_2_15_values.map(x => [#fmt4(x)]),
    ) <example_2_15_values_table>
  ]
}

#let example_2_15_zeros_ones_run(values: array) = {
  let run = ()
  let n = values.len()

  for i in range(0, values.len() - 1) {
    let assigned_number = if values.at(i + 1) > values.at(i) {
      1
    } else {
      0
    }
    run.push(assigned_number)
  }

  return run
}

#let sequence_runs_numbers(run: array) = {
  let number = 1 // the first number still counts as a run

  for i in range(run.len() - 1) {
    if run.at(i) != run.at(i + 1) {
      number += 1
    } else {
      continue
    }
  }

  number
}
