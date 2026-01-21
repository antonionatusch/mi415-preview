#import "number-tables-utils.typ": *

#let example_2_14_values = (
  0.97, 0.11, 0.65, 0.26, 0.98, 0.03, 0.13, 0.89, 0.21, 0.69
)


#let example_2_14_values_table() = {
  set text(size: 12pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..example_2_14_values.map(x => [#fmt4(x)]),
    ) <example_2_14_values_table>
  ]
}
