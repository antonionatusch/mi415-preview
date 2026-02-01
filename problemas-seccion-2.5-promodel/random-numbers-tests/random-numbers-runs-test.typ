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
    form la segunda corrida con longitud de uno; y así
    sucesivamente. Mediante el proceso anterior se determina
    $r_i$ que el número de corridas de la secuencia es $C_o = 14$.

    *Ejemplo*

    Realizar la prueba de corridas arriba y abajo con un nivel
    de aceptación de $95%$ al siguiente conjunto de 40 números
    $r_i$:

   // TODO: agregar conjunto de números según la pg. 42
  ]
}
