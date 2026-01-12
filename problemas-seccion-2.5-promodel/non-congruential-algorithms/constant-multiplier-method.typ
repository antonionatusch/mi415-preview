#import "../problem-tables-numbers/table-styles.typ": *

#let constant_multiplier_method = {
  [
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
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~26])
  ]
}
