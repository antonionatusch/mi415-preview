#import "number-tables-utils.typ" : *
#let x_0 = 69
#let m_param = 16
#let a_param = 14
#let b_param = 27
#let c_param = 5
#let x_1 = calc.rem((a_param * calc.pow(x_0, 2) + b_param * x_0 + c_param), m_param)

#let generated_x_numbers_array = range(2, 51).fold((x_1,), (acc, _) => {
  let prev = acc.at(acc.len() - 1)
  let next = calc.rem(
    a_param * calc.pow(prev, 2) + b_param * prev + c_param,
    m_param,
  )
  acc + (next,)
})


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

#let generated_r_numbers_array = generated_x_numbers_array.map(x_i => x_i / (m_param - 1))

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
