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
  ]
}
