#import "../problem-tables-numbers/number-tables-utils.typ" : fmt4

#let tabular_layout_table(..body, column_number: 3) = {
  let pad = (x: 6pt, y: 1pt)

  align(center)[
    #table(
      columns: column_number,
      align: left,
      inset: pad,
      column-gutter: 18pt,
      row-gutter: 8pt,
      stroke: none,
      ..body
    )
  ]
}
#let chi_squared_table(values: array) = {
  let pad = (x: 5pt, y: 8pt)
  let hdr(body) = table.cell([*#body*], align: center, inset: pad)
  let c(body) = table.cell(body, align: center, inset: pad)

  let fmt2(x) = {
    let y = calc.round(x * 100) / 100
    let s = str(y)
    if s.contains(".") {
      let parts = s.split(".")
      let frac = parts.at(1)
      if frac.len() == 0 { s + "00" } else if frac.len() == 1 { s + "0" } else { s }
    } else { s + ".00" }
  }

  let fmt1(x) = {
    let y = calc.round(x * 10) / 10
    let s = str(y)
    if s.contains(".") {
      let parts = s.split(".")
      let frac = parts.at(1)
      if frac.len() == 0 { s + "0" } else { s }
    } else { s + ".0" }
  }

  let n = values.len()
  let m = calc.max(2, int(calc.ceil(calc.sqrt(n))))
  let E = n / m
  let w = 1.0 / m

  // 1) calculamos "comp" por fila como números (para poder sumar)
  let comps = range(0, m).map(i => {
    let a = i * w
    let b = (i + 1) * w

    let O = if i == m - 1 {
      values.filter(v => v >= a and v <= 1.0).len()
    } else {
      values.filter(v => v >= a and v < b).len()
    }

    calc.pow(E - O, 2) / E
  })

  // 2) suma total chi-cuadrada (X0^2)
  let chi2 = comps.sum()

  // 3) ahora construimos las filas usando comps[i]
  let rows = range(0, m).map(i => {
    let a = i * w
    let b = (i + 1) * w

    let O = if i == m - 1 {
      values.filter(v => v >= a and v <= 1.0).len()
    } else {
      values.filter(v => v >= a and v < b).len()
    }

    let interval_label = if i == m - 1 {
      "[" + fmt2(a) + "-1.00]"
    } else {
      "[" + fmt2(a) + "-" + fmt2(b) + ")"
    }

    (
      c([#interval_label]),
      c([#O]),
      c([#E]),
      c([#fmt1(comps.at(i))]),
    )
  })

  // tabla
  (
    render: align(center)[
      #table(
        columns: (28%, 12%, 20%, 40%),
        align: (center, center, center, center),
        inset: pad,
        stroke: 0.6pt,
        row-gutter: 0pt,
        hdr("Intervalo"),
        hdr($O_i$),
        hdr($E_i = n/m$),
        hdr($((E_i - O_i)^2) / E_i$),
        ..rows.flatten(),
      )
    ],
    chi_squared_value_sum: chi2,
  )
}

#let values_as_table(values: array) = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..values.map(x => [#fmt4(x)]),
    )
  ]
}
