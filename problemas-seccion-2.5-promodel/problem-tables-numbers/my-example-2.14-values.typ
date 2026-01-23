#import "number-tables-utils.typ": *

#let my_example_2_14_values = (
  // new 15 random numbers
  0.42,
  0.87,
  0.15,
  0.74,
  0.33,
  0.59,
  0.05,
  0.91,
  0.28,
  0.68,
  0.12,
  0.80,
  0.47,
  0.99,
  0.22,
)


#let my_example_2_14_values_table() = {
  set text(size: 12pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..my_example_2_14_values.map(x => [#fmt4(x)]),
    ) <my_example_2_14_values_table>
  ]
}
