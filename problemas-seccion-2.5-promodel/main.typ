#import "imports.typ": *
#set heading(numbering: "1.1)")
#set text(lang: "es")
#set list(indent: 1cm)

#show heading.where(level: 1): set text(size: 14pt)
#show heading.where(level: 2): set text(size: 12pt)

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

= Notación y Conceptos
- $r_i = {r_1, r_2, r_3, dots, r_n}$: Secuencia de números aleatorios entre el intervalo $(0,1)$ que contiene $n$ números, todos ellos diferentes.
- $n$: _Período_ o _ciclo de vida_ del generador que creó la secuencia $r_i$.
- $ f(r): cases(
    1"," quad 0 <= r <= 1,
    0"," quad "en cualquier otro valor"
  ) $...distribución uniforme continua que debe seguir un conjunto de $r_i$.
- $N$: Período de vida _bastante grande_ para un generador de números pseudoaleatorios.
- $X_i$: Número entero positivo que se utiliza como semilla o detonador en los algoritmos congruenciales y no congruenciales para generar números pseudoaleatorios.
#cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~22-23])

== Algoritmos no congruenciales
=== Algoritmo de cuadrados medios
Este algoritmo no congruencial fue propuesto en la decada de los cuarenta del siglo xx
por Von Neumann y Metropolis. Requiere un número entero detonador (llamado semilla)
con $D$ dígitos, el cual es elevado al cuadrado para seleccionar del resultado los $D$
dígitos del centro; el primer número se determina simplemente anteponiendo el "0." a
esos dígitos. Para obtener el segundo $r_i$ se sigue el mismo procedimiento, solo que
ahora se elevan al cuadrado los $D$ dígitos del centro que se seleccionaron para obtener
el primer $r_i$. \
Este método se repite hasta obtener $n$ números $r_i$. A continuación
se presentan con más detalle los pasos para generar números con el algoritmo de cuadrados
medios.

1. Seleccionar una semilla $(X_0)$ con $D$ dígitos $(D > 3)$.
2. Sea $Y_0 =$ resultado de elevar $X_0$ al cuadrado; sea $X_1 =$ los $D$ dígitos del centro, y sea \ $r_i$ = 0.$D$ dígitos del centro.
3. Sea $Y_i =$ resultado de elevar $X_i$ al cuadrado; sea $X_(i+1) =$ los $D$ dígitos del centro, y sea \ $r_i$ = 0.$D$ dígitos del centro para toda $i = 1, 2, 3, dots, n$
4. Repetir el paso $3$ hasta obtener los $n$ números $r_i$ deseados.

*_Nota_* Si no es posible obtener los $D$ dígitos del centro del número $Y_i$, agregue ceros a la izquierda del número $Y_i$.
#cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~24])
#pagebreak()
*Ejemplo*

Generar los primeros $5$ números a partir de una semilla $X_0$ = 5735, de donde se puede observar que $D$ = 4 dígitos.

_Solución:_

#tabular_layout_table(
  $Y_0 = (5735)^2 = 32890225$,
  $X_1 = 8902$,
  $r_1 = 0.8902$,
  $Y_1 = (8902)^2 = 79245604$,
  $X_2 = 2456$,
  $r_2 = 0.2456$,
  $Y_2 = (2456)^2 = 06031936$,
  $X_3 = 0319$,
  $r_3 = 0.0319$,
  $Y_3 = (0319)^2 = 101761$,
  $X_4 = 0176$,
  $r_4 = 0.0176$,
  $Y_4 = (0176)^2 = 030976$,
  $X_5 = 3097$,
  $r_5 = 0.3097$,
)

El algoritmo de cuadrados medios generalmente es incapaz de generar una secuencia de \
r_i con periodo de vida $n$ grande. Además, en ocasiones sólo es capaz de generar un  \
número, por ejemplo, si $X_0 = 1000$, entonces $X_1 = 0000; r_i = 0.0000$ y se dice que \
el algoritmo se degenera con la semilla de $X_0 = 1000$.
#cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~25])

=== Algoritmo de productos medios
La mecánica de generación de números pseudoaleatorios de este algoritmo no congruencial
es similar a la del algoritmo de cuadrados medios. La diferencia entre ambos
radica en que el algoritmo de productos medios requiere dos semillas, ambas con $D$ dígitos;
además, en lugar de elevarlas al cuadrado, las semillas se multiplican y del producto
se seleccionan los $D$ dígitos del centro, los cuales formarán el primer numero pseudoaleatorio $r_i$ = 0.$D$ dígitos.
Después se elimina una semilla, y la otra se multiplica por el primer
numero de $D$ dígitos, para luego seleccionar del producto los $D$ dígitos que conformarán
un segundo numero $r_i$. Entonces se elimina la segunda semilla y se multiplican el primer
número de $D$ dígitos por el segundo número de $D$ dígitos; del producto se obtiene
el tercer número $r_i$. Siempre se irá eliminando el numero más antiguo, y el procedimiento
se repetirá hasta generar los $n$ números pseudoaleatorios. A continuación se presentan
con más detalle los pasos del método para generar números con el algoritmo de
producto medios.

1. Seleccionar una semilla $(X_0)$ con $D$ dígitos $(D > 3)$
2. Seleccionar una semilla $(X_1)$ con $D$ dígitos $(D > 3)$
3. Sea $Y_0 = X_0 ast X_1$; sea $X_2 = "los" D "dígitos del centro"$, y sea $r_i = 0.D$ dígitos del centro.
4. Sea $Y_i = X_i ast X_(i+1)$; sea $X_(i+2) = "los" D "dígitos del centro"$, y sea $r_(i+1) = 0.D$ dígitos del centro para toda $i = 1, 2, 3, dots, n$.
5. Repetir el paso $4$ hasta obtener los $n$ números $r_i$ deseados.

*_Nota_* Si no es posible obtener los $D$ dígitos del centro del número $Y_i$, agregue ceros a la \
izquierda del número $Y_i$.
#cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~25])

*Ejemplo*

Generar los primeros $5$ números $r_i$ a partir de las semillas $X_0 = 5015 "y" X_1 = 5374$; observe \
que ambas semillas tienen $D = 4$ dígitos.

_Solución:_

#tabular_layout_table(
  $Y_0 = (5015)(5734) = 28756010$,
  $X_2 = 7560$,
  $r_1 = 0.7560$,
  $Y_1 = (5734)(7560) = 43349040$,
  $X_3 = 3490$,
  $r_2 = 0.3490$,
  $Y_2 = (7560)(3490) = 26384400$,
  $X_4 = 3844$,
  $r_3 = 0.3844$,
  $Y_3 = (3490)(3844) = 13415560$,
  $X_5 = 4155$,
  $r_4 = 0.4155$,
  $Y_4 = (3844)(4155) = 15971820$,
  $X_6 = 9718$,
  $r_5 = 0.9718$,
)
#cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~26])

=== Algoritmo de multiplicador constante
Este algoritmo no congruencial es similar al algoritmo de productos medios. \
Los siguientes son los pasos necesarios para generar números pseudoaleatorios con el algoritmo
de multiplicador constante.

1. Seleccionar una semilla $(X_0)$ con $D$ dígitos $(D > 3)$.
2. Seleccionar una constante $(a)$ con $D$ dígitos $(D > 3)$.
3. Sea $Y_0 = a ast X_0$; sea $X_1 = "los" D "dígitos del centro"$, y sea $r_i = 0.D$ dígitos del centro.
4. Sea $Y_i = a ast X_i$; sea $X_(i+1) = "los" D "dígitos del centro"$, y sea $r_(i+1) = 0.D$ dígitos del centro para toda $i = 1, 2, 3, dots, n$.
5. Repetir el paso $4$ hasta obtener los $n$ números $r_i$ deseados.

*_Nota_* Si no es posible obtener los $D$ dígitos del centro del número $Y_i$, agregue ceros a la
izquierda del número $Y_i$.
#cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~26])

*Ejemplo*
Generar los primeros $5$ números $r_i$ a partir de la semilla $X_0 = 9803$ y con la constante \
$a = 6965$. Observe que tanto la semilla como la constante tienen $D = 4$ dígitos.

_Solución:_

#tabular_layout_table(
  $Y_0 = (6965)(9803) = 68277895$,
  $X_1 = 2778$,
  $r_1 = 0.2778$,
  $Y_1 = (6965)(2778) = 19348770$,
  $X_2 = 3487$,
  $r_2 = 0.3487$,
  $Y_2 = (6965)(3487) = 24286955$,
  $X_3 = 2869$,
  $r_3 = 0.2869$,
  $Y_3 = (6965)(2869) = 19982585$,
  $X_4 = 9825$,
  $r_4 = 0.9825$,
  $Y_4 = (6965)(9825) = 68431125$,
  $X_5 = 4311$,
  $r_5 = 0.4311$,
)


#bibliography("references/references.bib", style: "american-psychological-association")
