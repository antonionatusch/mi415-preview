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
