#let tabular_layout_table(..body) = {
  let pad = (x: 6pt, y: 1pt)

  align(center)[
    #table(
      columns: (auto, auto, auto),
      align: (left, left, left),
      inset: pad,
      column-gutter: 18pt,
      row-gutter: 2pt,
      stroke: none,
      ..body
    )
  ]
}
