#import "../problem-tables-numbers/example-2.15-values.typ": *
#let random_numbers_runs_test = {
  [
    El procedimiento de esta prueba consiste en determinar una
    secuencia de números $(S)$ que sólo contiene unos y ceros,
    de acuerdo con una comparación entre $r_i$ y $r_(i-1)$.
    Después se determinar el número de corridas observadas, $C_o$
    (una corrida se identifica como *la cantidad de unos o ceros*
    consecutivos). Luego se calcula el valor esperado, la varianza
    del número de corridas y el estadístico $Z_0$ mediante las
    ecuaciones:

    $ mu_(C_o) = (2n-1) / 3 $
    $ sigma^2_(C_o) = (16n-29) / 90 $
    $ Z_0 = abs((C_o - mu_(C_o)) / sigma_(C_o)) $

    Si el estadístico $Z_0$ es mayor que el valor crítico de
    $Z_(alpha\/2)$, se concluye que los números del conjunto
    $r_i$ no son independientes. De lo contrario no se puede
    rechazar que el conjunto de $r_i$ sea independiente.

    Considere el siguiente conjunto $r_i$ de $21$ números:

    #align(center)[
      $
        r_i = {0.89, 0.26, 0.01, 0.98, 0.13, 0.12, 0.69, 0.11, 0.05,
          0.65, \ 0.21, 0.04, 0.03, 0.11, 0.07, 0.97, 0.27, 0.12, 0.95, 0.02, 0.06
        }
      $
    ]

    La secuencia de unos y ceros se construye de esta manera:
    se coloca un cero si el número $r_i$ es menor que o igual
    al número $r_i$ anterior; en caso de ser mayor que el número
    $r_i$ anterior, se pone un uno. Si se considera la
    secuencia de los 21 números del conjunto $r_i$ que se dio
    antes, la secuencia de unos y ceros es:
    $
      S = {bold(0), bold(0), 1, bold(0), bold(0), 1, bold(0),
        bold(0), 1, bold(0), bold(0), bold(0), 1, bold(0), 1,
        bold(0), bold(0), 1, bold(0), 1}
    $

    #pagebreak()
    Observe que la secuenca S contiene $n-1$ números, en este
    caso $20$. Esto se debe a que el primer número $r_i = 0.89$
    no tiene número anterior con el cual compararlo. Recuerde
    que una corrida se forma con unos consecutivos o ceros
    consecutivos. Por ejemplo los primeros dos ceros de la
    secuencia forman la primer corrida, que se dice que tiene
    una longitud de dos; el tercer número de la secuencia, uno,
    forma la segunda corrida con longitud de uno; y así
    sucesivamente. Mediante el proceso anterior se determina
    $r_i$ que el número de corridas de la secuencia es $C_o = 14$.

    *Ejemplo*

    Realizar la prueba de corridas arriba y abajo con un nivel
    de aceptación de $95%$ al siguiente conjunto de 40 números
    $r_i$:

    #example_2_15_values_table()

    Realizaremos la asignación de unos y ceros por renglón (o fila).
    Por lo tanto, la secuencia S es:

    #let example_s_sequence = example_2_15_zeros_ones_run(values: example_2_15_values)
    #text(size: 10pt)[
      $ S = {#example_s_sequence.map(str).join(", ")} $
    ]

    #let book_example_c_o = sequence_runs_numbers(run: example_s_sequence)
    Y el número de corridas $C_o = #book_example_c_o$
    y $alpha = 5% = 0.05$

    A continuación se presentan los cálculos correspondientes
    al valor esperado y a la varianza del número de corridas:

    #let book_example_mu_sub_c_o = (2 * example_2_15_values.len() - 1) / 3
    #let book_example_sigma_squared_sub_c_o = (16 * example_2_15_values.len() - 29) / 90
    #let book_example_zeta = calc.abs(
      (book_example_c_o - book_example_mu_sub_c_o) / calc.sqrt(book_example_sigma_squared_sub_c_o),
    )

    $ mu_(C_o) = (2n - 1) / 3 = #book_example_mu_sub_c_o approx #fmt4(book_example_mu_sub_c_o) $
    $
      sigma^2_C_o = (16n - 29)/ 90 = #book_example_sigma_squared_sub_c_o approx #fmt4(book_example_sigma_squared_sub_c_o)
    $
    $ Z_0 = abs((C_o - mu_C_o) / sigma_C_o) = #book_example_zeta approx #fmt4(book_example_zeta) $

    *_Nota de autor: Estos cálculos se hicieron directamente con Typst,
    así que se usaron los valores exactos provistos por el módulo `calc`
    en vez de usar 3 o 4 decimales._*

    Como el estadístico $Z_0$ es menor que el valor de tabla de la
    normal estándar para $Z_(alpha\/2) = Z_(0.05\/2) = 1.96$, se
    concluye que no se puede rechazar que los números del conjunto
    $r_i$ son independientes. Es decir, de acuerdo con esta prueba,
    los números son aptos para usarse en simulación.
    \
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [pgs.~41--42])
  ]
}
