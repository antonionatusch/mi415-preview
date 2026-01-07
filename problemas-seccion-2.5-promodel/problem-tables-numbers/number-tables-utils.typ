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
