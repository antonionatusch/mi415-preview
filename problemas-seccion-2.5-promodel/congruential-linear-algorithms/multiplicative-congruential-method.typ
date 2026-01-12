#import "../problem-tables-numbers/table-styles.typ": *

#let multiplicative_congruential_method = {
  [
    El algortimo congruencial multiplicativo surge del algoritmo congruencial lineal cuando \
    $c = 0$. Entonces, la ecuación recursiva es:
    $ X_i+1 = (a X_i) mod (m) quad i = 0, 1, 2, dots, n $

    Para transformar los números $X_i$ en el intervalo $(0, 1)$ se usa la ecuación $r_i = x_i / (m-1)$. \
    De acuerdo con Banks, Carson, Nelson y Nicol, para que el algoritmo congruencial multiplicativo \
    logre el máximo periodo de vida $N$, es preciso que los parámetros cumplan las siguientes condiciones:

    $quad m = 2^g$ \
    $quad a = 3 + 8k o a = 5 + 8k$ \
    $quad k = 0, 1, 2, 3, dots$ \
    $quad X_0$ debe ser un número impar \
    $quad g$ debe ser entero \

    A partir de estas condiciones se logra un periodo de vida máximo: $N = k/4 = 2^(g-2)$.

    *Ejemplo*

    Generar suficientes números entre 0 y 1 con los parámetros $X_0 = 17, k = 2, g = 5$,
    hasta encontrar el periodo o ciclo de vida.

    _Solución:_
    $ a = 5 + 8 (2) = 21 quad "y" quad m = 32 $

    $ X_0 = 17 $
    #tabular_layout_table(
      $X_1 = (21*17) mod 32 = 5$,
      $r_1 = 5/31 = 0.612$,
      $X_2 = (21*5) mod 32 = 9$,
      $r_2 = 9/31 = 0.2903$,
      $X_3 = (21*9) mod 32 = 29$,
      $r_3 = 29/31 = 1.9354$,
      $X_4 = (21*29) mod 32 = 1$,
      $r_4 = 1/31 = 0.3225$,
      $X_5 = (21*1) mod 32 = 21$,
      $r_5 = 21/31 = 0.6774$,
      $X_6 = (21*21) mod 32 = 25$,
      $r_6 = 25/31 = 0.8064$,
      $X_7 = (21*25) mod 32 = 13$,
      $r_7 = 13/31 = 0.4193$,
      $X_8 = (21*13) mod 32 = 17$,
      $r_8 = 17/31 = 0.5483$,
      column_number: 2,
    )

    Si la semilla $X_0$ se repite, volverán a generarse los mismos números. Por lo tanto, el periodo de vida
    es $n = 8$, el cual corresponde a $N = m/4 = 32/4 = 8$.

    #pagebreak()
    *Otro ejemplo*

    Ahora bien, si quebrantamos la condición de que la semilla sea un número impar, digamos con $X_0 = 12$, tenemos:

    _Solución:_

    $ X_0 = 12 $
    #tabular_layout_table(
      $X_1 = (21*12) mod 32 = 28$,
      $r_1 = 28/31 = 0.9032$,
      $X_2 = (21*28) mod 32 = 12$,
      $r_2 = 12/31 = 0.3870$,
      column_number: 2,
    )

    En vista de que la semilla $X_0$ se repite, volverán a generarse los mismos números. Por lo tanto, \
    el periodo de vida es $N = 2$.
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~29--30])
  ]
}
