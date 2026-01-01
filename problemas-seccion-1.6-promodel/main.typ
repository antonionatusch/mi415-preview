#import "imports.typ": *
#set heading(numbering: "1.a)")
#set text(lang: "es")

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

#er_room_system_table()

== Un banco mercantil

#bank_system_table()

== Una línea telefónica de atención a clientes

#phoneline_system_table()

== La recepción de un hotel

#hotel_system_table()

== Un taller de tornos

#lathe_workshop_system_table()

== El proceso de pintura de un automóvil

#car_painting_system_table()

== Un hospital

#hospital_system_table()

#pagebreak()
#bibliography("references/references.bib", style: "american-psychological-association")
