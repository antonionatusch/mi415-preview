#set heading(numbering: "1.a)")
#set text(lang: "es")
#let pad = (x: 5pt, y: 4pt)
#let emptytablecell = table.cell([], stroke: none, inset: pad)
#let alignedboldcell(body) = {
  table.cell([*#body*], align: center, inset: pad)
}

#let system_headers = (
  table.cell(rowspan: 2, alignedboldcell("Entidades")),
  table.cell(colspan: 2, alignedboldcell("Eventos")),
  table.cell(rowspan: 2, alignedboldcell("Estados del Sistema")),
  table.cell(rowspan: 2, alignedboldcell("Localizaciones")),
  table.cell(rowspan: 2, alignedboldcell("Recursos")),
  table.cell(rowspan: 2, alignedboldcell("Atributos")),
  table.cell(colspan: 2, alignedboldcell("Variables")),
  // 2nd header row
  alignedboldcell("Actuales"),
  alignedboldcell("Futuros"),
  alignedboldcell("Continuas"),
  alignedboldcell("Discretas"),
)

#let system_table(..cells) = {
  set text(size: 8pt, hyphenate: false)

  table(
    columns: (4.7fr, 4.3fr, 4.1fr, 4.6fr, 6.9fr, 5.5fr, 4.6fr, 5.9fr, 3.7fr),
    column-gutter: 3pt,
    inset: (x: 4pt, y: 3pt),
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

#scale(x: 90%, y: 90%)[


  #system_table(
    [Doctores],
    [Médicos trabajando],
    [Cambio de turnos doctores, asistentes],
    [Usuarios atendidos],
    [Sala de espera],
    [Camillas],
    [Experiencia de los doctores, enfermeros y camilleros],
    [Horario del turno del personal],
    [Número de doctores en servicio],

    [Pacientes],
    [Pacientes atendidos],
    [Llegadas de pacientes con mayor gravedad],
    [Usuarios en espera],
    [Consultorio],
    [Camas],
    [Excelente atención hacia los pacientes],
    [Costo de los medicamentos],
    [Cantidad de pacientes],

    [Enfermeros],
    emptytablecell,
    emptytablecell,
    [Usuarios dados de alta],
    [Recepción],
    [Instrumentos médicos],
    [Higiene],
    emptytablecell,
    emptytablecell,

    [Asistentes],
    emptytablecell,
    emptytablecell,
    [Doctores en el turno],
    [Estacionamiento],
    [Medicamentos],
    [Rapidez al atender a los pacientes],
    emptytablecell,
    emptytablecell,

    emptytablecell,
    emptytablecell,
    emptytablecell,
    [Asistentes en el turno],
    [Pabellón de internos],
    [Mesas],
    emptytablecell,
    emptytablecell,
    emptytablecell,

    emptytablecell,
    emptytablecell,
    emptytablecell,
    [Enfermeros en el turno],
    emptytablecell,
    emptytablecell,
    emptytablecell,
    emptytablecell,
    emptytablecell,
  )
]



== otra
dsadas


#pagebreak()
#bibliography("references/references.bib", style: "american-psychological-association")
