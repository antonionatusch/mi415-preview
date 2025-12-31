#set text(lang: "es")

#let pad = (x: 1pt, y: 4pt)

#let emptytablecell = table.cell([], stroke: none, inset: pad)

#let header_cell(body, ..args) = {
  table.cell([*#body*], align: center, inset: pad, ..args)
}

#let pick(arr, i, filler: emptytablecell) = {
  if i < arr.len() and arr.at(i) != none { arr.at(i) } else { filler }
}

#let mk_system_cells(
  entities: (),
  events_now: (),
  events_future: (),
  states: (),
  locations: (),
  resources: (),
  attributes: (),
  vars_cont: (),
  vars_disc: (),
  min_rows: 0,
  filler: emptytablecell,
) = {
  let n = calc.max(
    min_rows,
    entities.len(),
    events_now.len(),
    events_future.len(),
    states.len(),
    locations.len(),
    resources.len(),
    attributes.len(),
    vars_cont.len(),
    vars_disc.len(),
  )

  let cells = ()
  for i in range(n) {
    cells = (
      cells
        + (
          pick(entities, i, filler: filler),
          pick(events_now, i, filler: filler),
          pick(events_future, i, filler: filler),
          pick(states, i, filler: filler),
          pick(locations, i, filler: filler),
          pick(resources, i, filler: filler),
          pick(attributes, i, filler: filler),
          pick(vars_cont, i, filler: filler),
          pick(vars_disc, i, filler: filler),
        )
    )
  }
  cells
}

#let system_headers = (
  header_cell("Entidades", rowspan: 2),
  header_cell("Eventos", colspan: 2),
  header_cell("Estados del Sistema", rowspan: 2),
  header_cell("Localizaciones", rowspan: 2),
  header_cell("Recursos", rowspan: 2),
  header_cell("Atributos", rowspan: 2),
  header_cell("Variables", colspan: 2),
  header_cell("Actuales"),
  header_cell("Futuros"),
  header_cell("Continuas"),
  header_cell("Discretas"),
)

#let system_table(..cells) = {
  set text(size: 8pt, hyphenate: true)

  table(
    columns: (4.7fr, 4.3fr, 4.1fr, 4.6fr, 6.9fr, 5.5fr, 4.6fr, 5.9fr, 3.7fr),
    column-gutter: 3pt,
    inset: (x: 4pt, y: 2pt),
    ..system_headers,
    ..cells,
  )
}
