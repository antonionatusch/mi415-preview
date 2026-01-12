#import "../problem-tables-numbers/table-styles.typ": *
#let middle_square_method = {
  [
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
    $r_i$ con periodo de vida $n$ grande. Además, en ocasiones sólo es capaz de generar un  \
    número, por ejemplo, si $X_0 = 1000$, entonces $X_1 = 0000; r_i = 0.0000$ y se dice que \
    el algoritmo se degenera con la semilla de $X_0 = 1000$.
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~25])
  ]
}
