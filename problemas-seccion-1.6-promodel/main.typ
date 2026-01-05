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

== Un sistema de respuesta en caso de emergencias

#emergency_answer_system_table()

#heading([
  Determine el promedio móvil de los números de la siguiente tabla y grafique los promedios.
  ¿Llega a estado estable la gráfica?
  En caso afirmativo, ¿a partir de qué valor se puede considerar el inicio del estado estable?
])

\
#problem_9_numbers_table()

\
$"Promedio móvil:" r_n = 1/n limits(sum)_(i=1)^n r_i "para" n = 1,2,dots,100$

Para $n = 10$ dado que tenemos 10 datos, el promedio móvil se calcula como:

$r_10 = 1/10 limits(sum)_(i=1)^n r_i$

Lo que da como resultado la siguiente tabla de promedios móviles:

#problem_9_moving_avg_table(window: 10)

#pagebreak()
#bibliography("references/references.bib", style: "american-psychological-association")
