#import "number-tables-utils.typ": *

#let problem_9_data = csv("../data/problem_9_data.csv").flatten().map(x => float(x))

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
        if frac.len() == 0 { "0000" } else if frac.len() == 1 { "000" } else if frac.len() == 2 { "00" } else { "0" }
      }
      intp + "." + frac + pad
    }
  }
}

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

#let moving_avg(data, window: 10) = {
  let n = window
  data
    .enumerate()
    .map(((i, _x)) => {
      if i + 1 < n {
        none
      } else {
        let start = i + 1 - n
        let chunk = data.slice(start, i + 1)
        chunk.sum() / n
      }
    })
}

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
