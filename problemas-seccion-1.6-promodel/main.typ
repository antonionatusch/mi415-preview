#import "system-tables/er-room.typ": hospital_system_table
#import "system-tables/bank.typ": bank_system_table
#import "system-tables/phoneline.typ": phoneline_system_table
#import "system-tables/hotel.typ": hotel_system_table
#set heading(numbering: "1.a)")
#set text(lang: "es")

#let pad = (x: 1pt, y: 4pt)

// A truly empty cell you can use for “visual merging” (no border)
#let emptytablecell = table.cell([], stroke: none, inset: pad)

// Header cell helper (bold + centered)
#let header_cell(body, ..args) = {
  table.cell([*#body*], align: center, inset: pad, ..args)
}

// Returns either the i-th item of `arr`, or `filler`.
// Also treats `none` inside the array as “missing”.
#let pick(arr, i, filler: emptytablecell) = {
  if i < arr.len() and arr.at(i) != none { arr.at(i) } else { filler }
}

// Build the row-major cell list for 9-column system table.
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
  // Events subheaders
  header_cell("Actuales"),
  header_cell("Futuros"),
  // Variables subheaders
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

#show heading.where(level: 1): set text(size: 12pt)
#show heading.where(level: 2): set text(size: 10pt)

#align(center)[
  #text(size: 24pt)[
    *Tarea 1 - Modelación y Simulación*
  ]

  #text(size: 18pt)[
    *Antonio Miguel Natusch Zarco* \
    *2022111958* \
    *Ingeniería de Sistemas*
  ]
]
\
#text(size: 14pt)[
  #underline[*Identificación de elementos de un sistema*]
]

Estos problemas se pueden encontrar en la *sección 1.6* del libro principal de la materia,
de #cite(<garcia2013simpromodel>, form: "prose", supplement: [p.~16--19]),

= Determine los elementos de cada uno de los siguientes sistemas, de acuerdo con lo que se comentó en la sección 1.2.

== La sala de emergencia de un hospital

#hospital_system_table()

== Un banco mercantil

#bank_system_table()

== Una línea telefónica de atención a clientes

#phoneline_system_table()

== La recepción de un hotel

#hotel_system_table()

#pagebreak()
#bibliography("references/references.bib", style: "american-psychological-association")
