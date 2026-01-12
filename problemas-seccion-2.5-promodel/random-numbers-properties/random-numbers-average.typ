#import "../problem-tables-numbers/table-styles.typ": *

#let random_numbers_average = {
  [
    En vista de que estos números deben tener la misma probabilidad de presentarse,
    es preciso que su comportamiento muestre una distribución de probabilidad uniforme continua,
    con límite inferior cero y límite superior uno. \
    La función de densidad de una distribución uniforme es la siguiente:
    $ f(x) = 1 / (b-a) quad a <= x <= b; "en este caso," a = 0 "y" b = 1 $

    Gráficamente, se vería de la siguiente manera:

    #figure(image("../figures/figure-2.1-a-b-dist.png", width: 80%), caption: [
      Figura  extraida del libro #cite(<garcia2013simpromodel>, form: "full", supplement: [p.~32])
    ])

    \
    Para obtener la media de la distribución multiplicamos la función de densidad por x,
    y la integramos en todo el rango de la misma distribución de la siguiente manera:
    $ E(x) = integral_a^b f(x) dif x = integral_a^b x / (b - a) dif x = x^2 / (2(b - a)) |_a^b $

    Sustituyendo los valores de $a = 0 "y" b = 1$,

    $ E(x) = 1/2 $

    Por lo tanto, el valor esperado (es decir, la media de los números aleatorios entre 0 y 1) es
    $mu = 0.5$.
    #cite(<garcia2013simpromodel>, form: "prose", supplement: [p.~32--33])
  ]
}
