#import "../problem-tables-numbers/table-styles.typ": *

#let random_numbers_variance = {
  [
    Si partimos de la misma distribución uniforme continua obtenemos la varianza
    de la distribución por medio de la ecuación:

    $ V(x) = sigma^2 = E(x^2) - mu^2 $

    Lo que nos da $E(x^2)$:
    $ E(x^2) = integral_a^b 1 / (b-a) (x)^2 dif x = x^3 / (3(b-a)) |_a^b = (b-a)^3 / (3(b-a)) = (b-a)^2 / 3 $

    Al sustituir $a = 0 "y" b = 1,$ tenemos que:

    $ E(x^2) = 1/3 $

    Por lo tanto,

    $ V(x) = 1/3 - (1/2)^2 = 12 $

    Dados estos resultados podemos decir que los números aleatorios entre 0 y 1 deben tener

    $ mu = 1/2 quad "y" quad sigma^2 = 1/12 $
    #cite(<garcia2013simpromodel>, form: "prose", supplement: [p.~33])
  ]
}
