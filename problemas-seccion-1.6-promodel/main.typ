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

#let hospital_entities = ("Doctores", "Pacientes", "Enfermeros", "Asistentes")
#let hospital_events_now = ("Médicos trabajando", "Pacientes atendidos")
#let hospital_events_future = (
  "Cambio de turnos doctores, asistentes",
  "Llegadas de pacientes con mayor gravedad",
)
#let hospital_states = (
  "Usuarios atendidos",
  "Usuarios en espera",
  "Usuarios dados de alta",
  "Doctores en el turno",
  "Asistentes en el turno",
  "Enfermeros en el turno",
)
#let hospital_locations = ("Sala de espera", "Consultorio", "Recepción", "Estacionamiento", "Pabellón de internos")
#let hospital_resources = ("Camillas", "Camas", "Instrumentos médicos", "Medicamentos", "Mesas")
#let hospital_attributes = (
  "Experiencia de los doctores, enfermeros y camilleros",
  "Excelente atención hacia los pacientes",
  "Higiene",
  "Rapidez al atender a los pacientes",
)
#let hospital_vars_cont = ("Horario del turno del personal", "Costo de los medicamentos")
#let hospital_vars_disc = ("Número de doctores en servicio", "Cantidad de pacientes")

#scale(x: 90%, y: 90%)[
  #system_table(
    ..mk_system_cells(
      entities: hospital_entities,
      events_now: hospital_events_now,
      events_future: hospital_events_future,
      states: hospital_states,
      locations: hospital_locations,
      resources: hospital_resources,
      attributes: hospital_attributes,
      vars_cont: hospital_vars_cont,
      vars_disc: hospital_vars_disc,
      min_rows: 6, // because states has 6 entries
    ),
  )
]

== Un banco mercantil

#let bank_entities = ("Cajeros", "Clientes", "Guardias")
#let bank_events_now = ("Atención en ventanilla", "Depósitos", "Retiros")
#let bank_events_future = ("Llegada de clientes", "Cambio de turno", "Cierre de caja")
#let bank_states = ("Clientes en cola", "Cajeros ocupados", "Clientes atendidos", "Cajeros libres")
#let bank_locations = ("Entrada", "Área de espera", "Ventanillas", "Oficina del gerente")
#let bank_resources = ("Cajas", "Sistema bancario", "Cámaras", "Efectivo")
#let bank_attributes = ("Tiempo de servicio", "Seguridad", "Capacidad de atención")
#let bank_vars_cont = ("Tiempo de espera", "Tiempo de servicio", "Costo operativo")
#let bank_vars_disc = ("# clientes en cola", "# cajeros activos", "# transacciones")

#scale(x: 90%, y: 90%)[
  #system_table(
    ..mk_system_cells(
      entities: bank_entities,
      events_now: bank_events_now,
      events_future: bank_events_future,
      states: bank_states,
      locations: bank_locations,
      resources: bank_resources,
      attributes: bank_attributes,
      vars_cont: bank_vars_cont,
      vars_disc: bank_vars_disc,
      min_rows: 6,
    ),
  )
]

#pagebreak()
#bibliography("references/references.bib", style: "american-psychological-association")
