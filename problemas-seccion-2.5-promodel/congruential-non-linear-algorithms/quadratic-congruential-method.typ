#import "../problem-tables-numbers/table-styles.typ": *

#let quadratic_congruential_method = {
  [
    Este algoritmo tiene la siguiente ecuación recursiva:

    $ X_(i+1) = (a X_i^2 + b X_i + c) mod (m) quad i = 0, 1, 2, 3, dots, N $

    Los números $r_i$ pueden ser generados mediante la ecuación:

    $ r_i = x_i / (m-1) $

    Las condiciones que deben cumplir los parámetros $m, a, b, "y" c$ para alcanzar un periodo máximo de
    N = m son:

    $quad m = 2^g$
    $quad a$ debe ser un número par
    $quad c$ debe ser un número impar
    $quad g$ debe ser entero
    $quad (b - 1) mod 4 = 1$

    De esta manera se logra un periodo de vida máximo: $N = m$.

    *Ejemplo*

    Generar a partir del algoritmo congruencial cuadrático los suficientes números enteros hasta
    alcanzar el periodo de vida, para esto considere los parámetros $X_0 = 13, m = 8, a = 26, b = 27 "y" c = 27$.
    Como todas las condiciones estipuladas para los parámetros se satisfacen, es de esperarse que el periodo de vida del generador sea N = m = 8,
    tal como podrá comprobar al revisar los cálculos correspondientes, que se presentan a continuación.

    _Solución:_

    $quad X_1 = (26 * 13^2 + 27 * 13 + 27) mod (8) = 4$ \
    $quad X_2 = (26 * 4^2 + 27 * 4 + 27) mod (8) = 7$ \
    $quad X_3 = (26 * 7^2 + 27 * 7 + 27) mod (8) = 2$ \
    $quad X_4 = (26 *2^2 + 27 * 2 + 27) mod (8) = 1$ \
    $quad X_5 = (26 * 1^2 + 27 * 1 + 27) mod (8) = 0$ \
    $quad X_6 = (26 * 0^2 + 27 * 0 + 27) mod (8) = 3$ \
    $quad X_7 = (26 * 3^2 + 27 * 3 + 27) mod (8) = 6$ \
    $quad X_8 = (26 * 6^2 + 27 * 6 + 27) mod (8) = 5$ \
    $quad X_9 = (26 * 5^2 + 27 * 5 + 27) mod (8) = 4$ \

    Por otro lado, el algoritmo cuadrático genera una secuencia de números enteros $S = (0, 1, 2, 3, dots, m - 1)$.
    al igual que el algoritmo congruencial lineal.
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~31--32])
  ]
}
