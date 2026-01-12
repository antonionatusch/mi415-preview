#import "../problem-tables-numbers/table-styles.typ": *

#let linear_congruential_method = {
  [
    Este algoritmo congruencial fue propuesto por Lehmer en 1951. Según Law y \
    Kelton, no ha sido el más usado. El algoritmo congruencial lineal genera una secuencia \
    de números enteros por medio de la siguiente ecuación recursiva:

    $
      X_i + 1 = (a x_i + c) mod (m) quad i = 0, 1, 2, 3, dots, n
    $

    donde $X_0$ es la semilla, $a$ es la constante multiplicativa, $c$ es una constante aditiva, y $m$
    es el módulo. $X_0 > 0, a > 0, c > 0, "y" m > 0$ deben ser números enteros. La operación "$mod (m)$" \
    significa multiplicar $X_i$ por $a$, sumar $c$, y dividir el resultado entre $m$ para obtener el residuo \
    $X_(i+1)$. Es importante señalar que la ecuación recursiva del algoritmo congruencial lineal \
    genera una secuencia de números enteros $S = (0, 1, 2, 3, dots, m - 1)$, y que para obtener \
    números pseudoaleatorios en el intervalo $(0, 1)$ se requiere la siguiente ecuación:

    $
      r_i = X_i / (m-1) quad i = 0, 1, 2, 3, dots, n
    $

    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~27])

    *Ejemplo 1*

    Generar $4$ números entre $0$ y $1$ con los siguientes parámetros: $X_0 = 37, a = 19, c = 33$ y \
    $m = 100$.

    _Solución:_

    #tabular_layout_table(
      $X_1 = (19 ast 37 + 33) mod 100 = 36$,
      $r_1 = 36/99 = 0.3636$,
      $X_2 = (19 ast 36 + 33) mod 100 = 17$,
      $r_2 = 17/99 = 0.1717$,
      $X_3 = (19 ast 17 + 33) mod 100 = 56$,
      $r_3 = 56/99 = 0.5656$,
      $X_4 = (19 ast 56 + 33) mod 100 = 97$,
      $r_4 = 97/99 = 0.9797$,
      column_number: 2,
    )

    En el ejemplo anterior se dieron de manera arbitraria cada uno de los parámetros requeridos:
    $X_0, a, c "y" m$. Sin embargo, para que el algoritmo sea capaz de lograr el máximo periodo
    de vida $N$, es preciso que dichos parámetros cumplan ciertas condiciones. Banks, Carson, Nelson y Nicol sugieren lo siguiente:

    $quad m = 2^g$ \
    $quad a = 1 + 4k$ \
    $quad k$ debe ser entero \
    $quad c$ relativamente primo a $m$ \
    $quad g$ debe ser entero \

    Bajo estas condiciones se obtiene un periodo de vida máximo: $N = m = 2^g$.

    *Ejemplo 2*
    Generar suficientes números entre 0 y 1 con los parámetros $X_0 = 6, k = 3, g = 3, "y" c = 7$, \
    hasta encontrar el periodo de vida máximo $(N)$.

    Como podemos ver, si se cumplen las condiciones que Banks, Carson, Nelson y Nicol \
    sugieren, se logrará el periodo máximo $N = m = 8$. A continuación se presente el desarrollo \
    de la generación de los números $r_(i^*)$

    $ a = 1 + 4 (3) = 13 "y" m = 2^3 = 8 $
    \
    $ X_0 = 6 $

    #tabular_layout_table(
      $X_1 = (13*6 + 7) mod 8 = 5$,
      $r_1 = 5/7 = 0.714$,
      $X_2 = (13*5 + 7) mod 8 = 0$,
      $r_2 = 0/7 = 0.000$,
      $X_3 = (13*0 + 7) mod 8 = 7$,
      $r_3 = 7/7 = 1.000$,
      $X_4 = (13*7 + 7) mod 8 = 2$,
      $r_4 = 2/7 = 0.285$,
      $X_5 = (13*2 + 7) mod 8 = 1$,
      $r_5 = 1/7 = 0.142$,
      $X_6 = (13*1 + 7) mod 8 = 4$,
      $r_6 = 4/7 = 0.571$,
      $X_7 = (13*4 + 7) mod 8 = 3$,
      $r_7 = 3/7 = 0.428$,
      $X_8 = (13*3 + 7) mod 8 = 6$,
      $r_8 = 6/7 = 0.857$,
      column_number: 2,
    )

    Es importante mencionar que el número generado en $X_8 = 6$ es exactamente igual a la semilla \
    $X_0$, y si continuáramos generando más números, éstos se repetirían. Además, \
    sabemos que el algoritmo congruencial lineal genera una secuencia de números enteros \
    $S = (0, 1, 2, 3, dots, m - 1)$. Observe que en este caso de genera la secuencia $S$ \
    $= (0, 1, 2, 3, 4, 5, 6, 7)$, es decir, se generan todos los números enteros \

    *Ejemplo 3*
    Consideremos de nuevo el ejemplo anterior, pero tratemos de infringir de manera arbitraria
    alguna de las condiciones. Supongamos que $a = 12$; se sabe que $a$ no es el resultado \
    de $1 + 4k$, donde $k$ es un entero. Veamos el comportamiento del algoritmo congruencial \
    lineal ante tal cambio.

    _Solución:_

    $ a = 1 + 4 (3) = 13 "y" m = 2^3 = 8 $
    \
    $ X_0 = 6 $

    #tabular_layout_table(
      $X_1 = (12*6 + 7) mod 8 = 7$,
      $r_1 = 7/7 = 1.000$,
      $X_2 = (12*7 + 7) mod 8 = 3$,
      $r_2 = 3/7 = 0.428$,
      $X_3 = (12*3 + 7) mod 8 = 3$,
      $r_3 = 3/7 = 0.428$,
      column_number: 2,
    )

    El periodo de vida en este caso es $N = 2$, de manera que, como puede ver, el periodo de \
    vida máximo no se logra. Como conclusión tenemos que si no se cumple alguna de las \
    condiciones, el periodo de vida máximo $N = m$ no se garantiza, por lo que el periodo de \
    vida será menor que $m$.

    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~27--28])
  ]
}
