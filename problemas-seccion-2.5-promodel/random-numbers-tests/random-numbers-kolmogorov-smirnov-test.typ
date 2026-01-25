#import "../problem-tables-numbers/example-2.14-values.typ": *
#import "../problem-tables-numbers/my-example-2.14-values.typ": *
#import "../problem-tables-numbers/table-styles.typ": ks_table
#let BOOK_PATH = "../../books/libro-02-simulacion-promodel-garcia-garcia-cardenas.pdf"

#let random_numbers_kolmogorov_smirnov_test = {
  [
    Propuesta por Kolmogorov y Smirnov, ésta es una prueba
    estadística que también nos sirve para determinar si
    un conjunto $r_i$ cumple la propiedad de uniformidad.
    Es recomendable aplicarla en conjuntos $r_i$ pequeños,
    por ejemplo, $n lt 20$. El procedimiento es el
    siguiente:

    #align(center)[
      #enum(
        indent: 1cm,
        [Ordenar de menor a mayor los números del conjunto $r_i$
          $ r_1, <= r_2 <= r_3 <= dots <= r_n $
        ],
        [Determinar los valores de: $D^+, D^-, "y" D$
          con las siguientes ecuaciones:

          $ D^+ = max_(1<=i<=n) { i/n - r_i } $
          $ D^- = max_(1<=i<=n) { n - i / n } $
          $ D = max(D^+, D^-) $
        ],
        [Determinar el valor crítico $D_(alpha,n)$ de acuerdo con
          la tabla de valores críticos de Kolmogorov-Smirnov
          para un grado de confianza $alpha$, y según el
          tamaño de la muestra $n$],
        [Si el valor $D$ es mayor que el valor crítico
          $D_(alpha,n)$, se concluye que los números
          del conjunto $r_i$ no siguen una distribución
          uniforme; de lo contrario, se dice que no
          se ha detectado diferencia significativa entre
          la distribución de los números del conjunto
          $r_i$ y la distribución uniforme.],
      )
    ]

    *Ejemplo*

    Realizar la prueba Kolmogorov-Smirnov, con un nivel de
    confianza $N C = 90% = 0.90$, al siguiente conjunto
    $r_i$ de 10 números:
    $ #example_2_14_values.map(str).join(", ") $

    El nivel de confianza de 90% implica $alpha = 10% = 0.10$.
    Si se ordenan los números $r_i$ de menor a mayor,
    la secuencia es:
    $ #example_2_14_values.sorted().map(str).join(", ") $

    Para determinar los valores de $D^+, D^- y D$ es
    recomendable realizar una tabla como la siguiente:

    #ks_table(values: example_2_14_values)

    #pagebreak()
    De acuerdo con la tabla de valores para la prueba
    Kolmogorov-Smirnov:
    #figure(
      image(BOOK_PATH, page: 340, width: 100%),
    ) <ks-critical-values>

    #pagebreak()

    ...el valor crítico $D_(0.10, 10)$ correpondiente a
    $n = 10$ es $D_(0.10, 10) = 0.368$, que resulta
    mayor al valor $D = 0.24$; por lo tanto,
    se concluye que los números del conjunto $r_i$
    se disribuyen uniformemente.
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [pgs.~38--40])

    *Ejemplo propio*
    Genere $n = 15$ números aleatorios y aplique la prueba
    Kolmogorov-Smirnov con un nivel de confianza de
    $N C = 95% = 0.95$.
    El nivel de confianza de 95% implica $alpha = 5% = 0.05$.
    #let my_alpha = 0.05

    *1. Números $r_i$:*
    $ #my_example_2_14_values.map(str).join(", ") $

    *2. Ordenar los números:*
    $ #my_example_2_14_values.sorted().map(str).join(", ") $

    Para determinar los valores de $D^+, D^- y D$ es
    recomendable realizar una tabla como la siguiente:

    #ks_table(values: my_example_2_14_values)

    #pagebreak()
    Volviendo a ver la @ks-critical-values, nos damos cuenta que
    el valor crítico $D_(0.05, 15)$ según tablas es es $0.338$.

    Como el valor $D = 0.08$ es menor que el valor crítico
    $0.338$, entonces se concluye que los números del conjunto $r_i$
    se disribuyen uniformemente.
  ]
}
