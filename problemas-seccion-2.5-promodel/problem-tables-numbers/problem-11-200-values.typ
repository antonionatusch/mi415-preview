#import "number-tables-utils.typ": *

#let problem_11_200_values_data_original = (
  csv("../data/problem_11_200_values_data.csv", delimiter: ",")
    .slice(1) // get rid of header
    .map(row => row.at(0)) // only keep first column
    .filter(x => x != "" and x != none) // remove empty values
    .map(x => float(x))
)

#let problem_11_200_values_data_new = (
  csv("../data/problem_11_200_values_data.csv", delimiter: ",")
    .slice(1) // get rid of header
    .map(row => row.at(1)) // only keep second column
    .filter(x => x != "" and x != none) // remove empty values
    .map(x => float(x))
)

#let problem_11_200_values_original_numbers_table() = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..problem_11_200_values_data_original.map(x => [#fmt4(x)]),
    ) <problem-11-200-values-original-data-table>
  ]
}

#let problem_11_200_values_new_random_numbers_table() = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..problem_11_200_values_data_new.map(x => [#fmt4(x)]),
    ) <problem-11-200-values-new-random-numbers-table>
  ]
}

#let problem_11_200_values_moving_avg_table(window: 10) = {
  let avgs = moving_avg(problem_11_200_values_data_new, window: window)

  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..avgs.map(a => if a == none { [] } else { [#fmt4(a)] }),
    ) <problem-10-moving-avg-table>
  ]
}
