#import "number-tables-utils.typ": *

#let example_2_11_values = (
  csv("../data/example-2.11.csv", delimiter: ",")
    .map(row => row.at(0)) // only keep first column
    .filter(x => x != "" and x != none) // remove empty values
    .map(x => float(x))
)


#let example_2_11_values_table() = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..example_2_11_values.map(x => [#fmt4(x)]),
    ) <example_2_11_values_table>
  ]
}
