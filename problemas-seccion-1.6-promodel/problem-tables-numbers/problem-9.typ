// -------------------------
// Problema 9: datos + tabla + promedio móvil (n=10)
// -------------------------

// -------------------------
// Datos como arreglo (100)
// -------------------------
#let problem_9_data  = csv("../data/problem_9_data.csv").flatten().map(x => float(x))

// -------------------------
// fmt4: fuerza 4 decimales sin precision ni repeat()
// -------------------------
#let fmt4(x) = {
  let y = calc.round(x * 10000) / 10000
  let s = str(y)

  if not s.contains(".") {
    s + ".0000"
  } else {
    let parts = s.split(".")
    let intp = parts.at(0)
    let frac = parts.at(1)

    if frac.len() >= 4 {
      intp + "." + frac.slice(0, 4)
    } else {
      let pad = {
        if frac.len() == 0 { "0000" } else if frac.len() == 1 { "000" } else if frac.len() == 2 { "00" } else { "0" } // frac.len() == 3
      }
      intp + "." + frac + pad
    }
  }
}

// -------------------------
// Tabla original (10x10)
// -------------------------
#let problem_9_numbers_table() = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..problem_9_data.map(x => [#fmt4(x)]),
    ) <problem-9-data-table>
  ]
}

// -------------------------
// Promedio móvil con ventana n=10
// - primeras 9 celdas: vacías
// - desde la 10ma: promedio de los últimos 10
// -------------------------
#let moving_avg(data, window: 10) = {
  let n = window
  data
    .enumerate()
    .map(((i, _x)) => {
      if i + 1 < n {
        none
      } else {
        let start = i + 1 - n
        let chunk = data.slice(start, i + 1) // fin exclusivo
        chunk.sum() / n
      }
    })
}

// -------------------------
// Tabla 10x10 con el promedio móvil (n=10)
// -------------------------
#let problem_9_moving_avg_table(window: 10) = {
  let avgs = moving_avg(problem_9_data, window: window)

  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..avgs.map(a => if a == none { [] } else { [#fmt4(a)] }),
    ) <problem-9-moving-avg-table>
  ]
}

// -------------------------
// Ejemplo de uso en tu documento:
// -------------------------
//
// #problem_9_numbers_table()
//
// #text(size: 11pt)[*Promedio móvil con n = 10*]
//
// #problem_9_moving_avg_table(window: 10)
// -------------------------
