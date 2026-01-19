#import "number-tables-utils.typ": *

#let example_2_13_values = (
  csv("../data/example-2.13.csv", delimiter: ",")
    .map(row => row.at(0)) // only keep first column
    .filter(x => x != "" and x != none) // remove empty values
    .map(x => float(x))
)


#let example_2_13_values_table() = {
  set text(size: 12pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..example_2_13_values.map(x => [#fmt4(x)]),
    ) <example_2_13_values_table>
  ]
}
