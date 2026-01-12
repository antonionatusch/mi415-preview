#import "../problem-tables-numbers/table-styles.typ": *

#let additive_congruential_method = {
  [
    Este algoritmo requiere una secuencia previa de $n$ números enteros $X_1, X_2, X_3, X_4, dots, X_n$ \
    para generar una nueva secuencia de números enteros que empieza en $X_(n+1), X_(n+2), X_(n+3), X_(n+4), dots$.

    Su ecuación recursiva es:

    $ X_i = (X_(i+1) + X_(i-n)) mod (m) quad i = n + 1, n + 2, n + 3, dots N $

    Los números $r_i$ pueden ser generados mediante la ecuación:

    $ r_i = x_i / (m-1) $

    *Ejemplo*

    Generar 7 números pseudoaleatorios entre cero y uno a partir de la siguiente secuencia de números enteros:
    $65, 89, 98, 03, 69; m = 100$. \
    $quad$ Sean $X_1 = 65, X_2 = 89, X_3 = 98, X_4 = 03, X_5 = 69$. Para generar $r_1, r_2, r_3, r_4, r_5, r_6 "y" r_7$ \
    antes es necesario generar $X_6, X_7, X_8, X_9, X_10, X_11, X_12$.

    _Solución:_
    #tabular_layout_table(
      $X_6 = (X_5 + X_1) mod 100 = (69 + 65) mod 100 = 34$,
      $r_6 = 34/99 = 0.3434$,
      $X_7 = (X_6 + X_2) mod 100 = (34 + 89) mod 100 = 23$,
      $r_7 = 23/99 = 0.2323$,
      $X_8 = (X_7 + X_3) mod 100 = (23 + 98) mod 100 = 21$,
      $r_8 = 21/99 = 0.2121$,
      $X_9 = (X_8 + X_4) mod 100 = (21 + 03) mod 100 = 24$,
      $r_9 = 24/99 = 0.2424$,
      $X_10 = (X_9 + X_5) mod 100 = (24 + 69) mod 100 = 93$,
      $r_10 = 93/99 = 0.9393$,
      $X_11 = (X_10 + X_6) mod 100 = (93 + 34) mod 100 = 27$,
      $r_11 = 27/99 = 0.2727$,
      $X_12 = (X_11 + X_7) mod 100 = (27 + 23) mod 100 = 50$,
      $r_12 = 50/99 = 0.5050$,
      column_number: 2,
    )

    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~30])
  ]
}
