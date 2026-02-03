#import "number-tables-utils.typ": *

#let my_example_2_15_values = (
  0.1527,
  0.7317,
  0.5087,
  0.5342,
  0.3959,
  0.7052,
  0.5591,
  0.2589,
  0.8941,
  0.0946,
  0.7658,
  0.0971,
  0.1137,
  0.7386,
  0.2129,
  0.1718,
  0.0536,
  0.3387,
  0.8376,
  0.5117,
  0.3716,
  0.4876,
  0.2900,
  0.9567,
  0.0060,
  0.3207,
  0.6334,
  0.1647,
  0.3424,
  0.5636,
  0.0247,
  0.8802,
  0.7608,
  0.0573,
  0.5154,
  0.7738,
  0.4861,
  0.1165,
  0.6748,
  0.1930,
  0.9752,
  0.5825,
  0.2308,
  0.4127,
  0.9293,
  0.4171,
  0.4428,
  0.6090,
  0.6489,
  0.9703,
)


#let my_example_2_15_values_table() = {
  set text(size: 12pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..my_example_2_15_values.map(x => [#fmt4(x)]),
    ) <my_example_2_15_values_table>
  ]
}

#let my_example_2_15_zeros_ones_run(values: array) = {
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
