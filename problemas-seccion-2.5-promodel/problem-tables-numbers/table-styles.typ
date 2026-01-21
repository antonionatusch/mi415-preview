#import "../problem-tables-numbers/number-tables-utils.typ": fmt4

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

// ------------------------------------------------------------
// Tabla 2.2: Prueba Kolmogorov–Smirnov (uniformidad en (0,1))
// Input: values (array) con r_i en (0,1)
// Construye tabla estilo libro y calcula D+, D-, D
// ------------------------------------------------------------
#let ks_table(values: array) = {
  // ---------- helpers ----------
  let pad = (x: 5pt, y: 8pt)

  let hdr(body) = table.cell([*#body*], align: center, inset: pad)
  let c(body) = table.cell(body, align: center, inset: pad)
  let l(body) = table.cell(body, align: left, inset: pad)

  // fixed "two decimals"
  let fmt2(x) = {
    let y = calc.round(x * 100) / 100
    let s = str(y)
    if s.contains(".") {
      let parts = s.split(".")
      let frac = parts.at(1)
      if frac.len() == 0 { s + "00" } else if frac.len() == 1 { s + "0" } else { s }
    } else { s + ".00" }
  }

  // two decimals but keep minus sign nicely
  let fmt2s(x) = fmt2(x)

  // ---------- data ----------
  let n = values.len()

  // ordenar r_i ascendente
  let r = values.sorted()

  // i = 1..n
  let idx = range(1, n + 1)

  // i/n, (i-1)/n
  let i_over_n = idx.map(i => i / n)
  let im1_over_n = idx.map(i => (i - 1) / n)

  // diferencias (según el ejemplo del libro):
  // i/n - r_i  (puede ser negativo)
  // r_i - (i-1)/n
  let diff_plus = idx.map(i => (i / n) - r.at(i - 1))
  let diff_minus = idx.map(i => r.at(i - 1) - ((i - 1) / n))

  // D+ = max(i/n - r_i)
  // D- = max(r_i - (i-1)/n)
  let Dplus = calc.max(..diff_plus)
  let Dminus = calc.max(..diff_minus)
  let D = calc.max(Dplus, Dminus)

  // ---------- build rows (each row is: label cell + n numeric cells) ----------
  let row_nums = (label, arr) => (
    l(label),
    ..arr.map(x => c([#fmt2s(x)])),
  )

  let row_ints = (label, arr) => (
    l(label),
    ..arr.map(x => c([#x])),
  )

  // header row for i: label + 1..n
  let header_i = (
    hdr("i"),
    ..idx.map(i => hdr([#i])),
  )

  // body rows
  let row_i_over_n = row_nums([$i/n$], i_over_n)
  let row_r_i = row_nums([$r_i$], r)
  let row_im1_over_n = row_nums([$(i-1)/n$], im1_over_n)
  let row_diff_plus = row_nums([$(i/n) - r_i$], diff_plus)
  let row_diff_minus = row_nums([$r_i - (i-1)/n$], diff_minus)

  // bottom summary row (como el libro: n, D+, D-, D en una sola fila)
  // ponemos: "n" en la primera celda y el valor n en la siguiente; el resto vacío.
  let empties = range(0, n - 1).map(_ => c([])) // para completar columnas

  let bottom = (
    l("n"),
    c([#n]),
    ..range(0, n - 1).map(_ => c([])),
    // Nota: este row ya llenó todas las columnas; en lugar de meter D+ D- D ahí,
    // hacemos una fila extra como el libro: "D+" valor, "D-" valor, "D" valor.
  )

  // Fila con D+, D-, D repartidos (quedan en columnas 2, 4, 6 por ejemplo)
  // Para que se parezca al libro, lo metemos en pares: etiqueta, valor, etiqueta, valor, etiqueta, valor, resto vacío.
  let summary_cells = {
    // construimos: [D+] [val] [D-] [val] [D] [val] y rellenamos
    let base = (
      l([$D^+$]),
      c([#fmt2(Dplus)]),
      l([$D^-$]),
      c([#fmt2(Dminus)]),
      l([$D$]),
      c([#fmt2(D)]),
    )
    // ya usamos 1+1+1+1+1+1 = 6 celdas; total debe ser (n+1) celdas.
    // rellenamos lo que falte.
    let used = 6
    let need = (n + 1) - used
    if need > 0 { (..base, ..range(0, need).map(_ => c([]))) } else { base }
  }

  // ---------- render ----------
  align(center)[
    #table(
      // 1ra columna (labels) + n columnas de datos
      columns: (22%, ..range(0, n).map(_ => (78% / n))),
      align: (left, ..range(0, n).map(_ => center)),
      inset: pad,
      stroke: 0.6pt,
      row-gutter: 0pt,

      // header
      ..header_i,

      // rows
      ..row_i_over_n,
      ..row_r_i,
      ..row_im1_over_n,
      ..row_diff_plus,
      ..row_diff_minus,

      // n row
      ..bottom,

      // summary row
      ..summary_cells,
    )
  ]
}
