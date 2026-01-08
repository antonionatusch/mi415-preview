#import "imports.typ": *
#set heading(numbering: "1.a)")
#set text(lang: "es")
#set list(indent: 1cm)

#show heading.where(level: 1): set text(size: 12pt)
#show heading.where(level: 2): set text(size: 10pt)

#align(center)[
  #text(size: 24pt)[
    *Tarea 2 - Modelación y Simulación*
  ]

  #text(size: 18pt)[
    *Antonio Miguel Natusch Zarco* \
    *2022111958* \
    *Ingeniería de Sistemas*
  ]
]
\

#text(size: 14pt)[
  #underline[*Números pseudoaleatorios*]
]

Estos problemas se pueden encontrar en la *sección 2.5* del libro principal de la materia,
de #cite(<garcia2013simpromodel>, form: "prose", supplement: [p.~52--58]),

= Notación
  - $r_i = {r_1, r_2, r_3, dots, r_n}$: Secuencia de números aleatorios entre el intervalo $(0,1)$ que contiene $n$ números, todos ellos diferentes.
  - $n$: _Período_ o _ciclo de vida_ del generador que creó la secuencia $r_i$.

#bibliography("references/references.bib", style: "american-psychological-association")
