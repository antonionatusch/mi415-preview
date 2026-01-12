#import "../problem-tables-numbers/table-styles.typ": *
#let middle_product_method = {
  [
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

    #pagebreak()
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
  ]
}
