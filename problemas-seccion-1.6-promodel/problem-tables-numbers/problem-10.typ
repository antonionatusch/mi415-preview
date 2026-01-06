#import "number-tables-utils.typ": *

#let problem_10_data = csv("../data/problem_10_data.csv").flatten().map(x => float(x))

#let problem_10_numbers_table() = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..problem_10_data.map(x => [#fmt4(x)]),
    ) <problem-10-data-table>
  ]
}

#let problem_10_moving_avg_table(window: 10) = {
  let avgs = moving_avg(problem_10_data, window: window)

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
