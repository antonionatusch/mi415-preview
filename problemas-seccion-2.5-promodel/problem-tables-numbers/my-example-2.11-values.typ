#import "number-tables-utils.typ": *
#import "algorithms.typ": *
#let x_0 = 69
#let m_param = 16
#let a_param = 14
#let b_param = 27
#let c_param = 5
#let x_1 = calc.rem((a_param * calc.pow(x_0, 2) + b_param * x_0 + c_param), m_param)

#let generated_x_numbers_array = quadratic_congruential_generator(
  x_0: x_0,
  a_param: a_param,
  b_param: b_param,
  c_param: c_param,
  m_param: m_param,
  n_terms: 50,
).x_numbers

#let generated_x_numbers_table() = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..generated_x_numbers_array.map(x => [#fmt4(x)]),
    ) <generated-x-numbers-table>
  ]
}

#let generated_r_numbers_array = quadratic_congruential_generator(
  x_0: x_0,
  a_param: a_param,
  b_param: b_param,
  c_param: c_param,
  m_param: m_param,
  n_terms: 50,
).r_numbers

#let generated_r_numbers_table() = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..generated_r_numbers_array.map(x => [#fmt4(x)]),
    ) <generated-r-numbers-table>
  ]
}
