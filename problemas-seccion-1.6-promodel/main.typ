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
  Problema 9. Determine el promedio móvil de los números de la siguiente tabla y grafique los promedios.
  ¿Llega a estado estable la gráfica?
  En caso afirmativo, ¿a partir de qué valor se puede considerar el inicio del estado estable?
])

\
#problem_9_numbers_table()

\
$"Promedio móvil:" r_n = 1/n limits(sum)_(i=1)^n r_i "para" n = 1,2,dots,100$

Para $n = 10$ dado que tenemos 10 datos, el promedio móvil se calcula como:

$r_10 = 1/10 limits(sum)_(i=1)^10 r_i$

Lo que da como resultado la siguiente tabla de promedios móviles:

#problem_9_moving_avg_table(window: 10)
\
Graficando, tenemos lo siguiente:

#align(center)[
  #image("./plots/problem-9/moving_average_plot.png", width: 110%)
]

Se puede observar que la gráfica llega a un estado estable alrededor del valor de $0.5$,
y se puede considerar que el inicio del estado estable es a partir del valor número $n approx 25$.

#pagebreak()
#heading([
  Problema 10. Determine el promedio móvil de los números de la siguiente tabla y grafique los promedios.
  ¿Llega a estado estable la gráfica?
  En caso afirmativo, ¿a partir de qué valor se puede considerar el inicio del estado estable?
])

\
#problem_10_numbers_table()

\
$"Promedio móvil:" r_n = 1/n limits(sum)_(i=1)^n r_i "para" n = 1,2,dots,100$

Para $n = 15$ dado que tenemos 15 datos, el promedio móvil se calcula como:

$r_15 = 1/15 limits(sum)_(i=1)^15 r_i$

Lo que da como resultado la siguiente tabla de promedios móviles:

#problem_10_moving_avg_table(window: 15)
\
#pagebreak()
Graficando, tenemos lo siguiente:

#align(center)[
  #image("./plots/problem-10/moving_average_plot.png", width: 110%)
]

Se puede observar que la gráfica llega a un estado estable alrededor del valor de $0.5$,
y se puede considerar que el inicio del estado estable es a partir del valor número $n approx 40$.

#pagebreak()
#heading([
  Genere en una hoja de cálculo 100 números con la función $x_i = -3 ln(1-r_i)$; donde $r_i$ es
  un número pseudoaleatorio entre cero y uno, obtenido a partir de la función
  ALEATORIO de la hoja de cálculo. Suponga que estos valores son tiempos de proceso
  de cierta pieza. Determine un promedio móvil de estos valores conforme se va realizando el procesamiento
  de las piezas, y grafique ese promedio ¿El tiempo promedio
  de proceso es estable? ¿Y si en lugar de 100 se generan 200 números? {Sugerencia:
  Para evitar que se recalculen los números aleatorios es necesario copiarlos y pegarlos
  mediante pegado especial de sólo valores).

])

Números generados por la función *ALEATORIO* de la hoja de cálculo:
\
#problem_11_100_values_original_numbers_table()

#pagebreak()
Números transformados por la función $x_i = -3 ln(1-r_i)$:

#problem_11_100_values_new_random_numbers_table()

Promedio móvil con ventana de 10:
\
#problem_11_100_values_moving_avg_table(window: 10)

Graficando, tenemos lo siguiente:
#align(center)[
  #image("./plots/problem-11/moving_average_plot_100.png", width: 90%)
]

Se puede observar que el tiempo promedio del proceso *no es estable*.
Al extender el número de datos a 200:

#pagebreak()
Números generados por la función *ALEATORIO* de la hoja de cálculo:
#problem_11_200_values_original_numbers_table()

Números transformados por la función $x_i = -3 ln(1-r_i)$:
#problem_11_200_values_new_random_numbers_table()

#pagebreak()
Promedio móvil con ventana de 20:
#problem_11_200_values_moving_avg_table(window: 20)

Graficando, tenemos lo siguiente:
#align(center)[
  #image("./plots/problem-11/moving_average_plot_200.png", width: 90%)
]

Se puede observar que, en este caso, el tiempo promedio del proceso *sí es estable,*
donde llega a un estado estable alrededor del valor de $3$, con un $n approx 25$

#pagebreak()
#bibliography("references/references.bib", style: "american-psychological-association")
