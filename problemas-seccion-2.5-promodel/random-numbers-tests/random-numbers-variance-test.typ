#import "../problem-tables-numbers/example-2.11-values.typ": *
#let BOOK_PATH = "../../books/libro-02-simulacion-promodel-garcia-garcia-cardenas.pdf"
#let random_numbers_variance_test = {
  [
    Otra de las propiedades que debe satisfacer el conjunto $r_i$
    es que sus números tengan una varianza de $1/12$. La prueba que
    busca determinar lo anterior es la _prueba de varianza,_ que
    establece las siguientes hipótesis: \
    $quad H_0: sigma^2_(r_i) = 1\/12$ \
    $quad H_1: sigma^2_(r_i) != 1\/12$

    La prueba de varianza consiste en determinar la varianza de los
    $n$ números que contiene el conjunto $r_i$, mediante la ecuación
    siguiente:

    $ V(r) = (limits(sum)_(i=1)^n (r_i - dash(r))^2)/(n - 1) $

    Después se calculan los límites de aceptación inferior y superior
    con las ecuaciones siguientes:
    $ L S_(V(r)) = (chi^2_(alpha\/2, n - 1)) / (12(n - 1)) $
    $ L I_(V(r)) = (chi^2_((1 - alpha)\/2, n - 1)) / (12(n - 1)) $

    Si el valor de $V(r)$ se encuentra entre los límites de aceptación,
    decimos que no se puede rechazar que el conjunto $r_i$ tiene una
    varianza de $1\/12$, con un nivel de aceptación de $1 - alpha$;
    de lo contrario, se rechaza que el conjunto $r_i$ tiene una varianza
    de $1\/12$. Para obtener valores de los factores $chi^2$ vea los
    anexos del libro.



    #for p in (337, 338) {
      image(BOOK_PATH, page: p, width: 100%)
      pagebreak()
    }
    (Estas tablas fueron extraídas del apéndice en las páginas 335 y 336 del libro
    de #cite(<garcia2013simpromodel>, form: "full"))<chi-squared-dist-tables>

    *Ejemplo*

    Realizar la prueba de varianza a los 40 números $r_i$ del ejemplo 2.11. \
    $quad$ Considerando que $n = 40$ y $alpha = 5%$, procedemos a calcular
    la varianza de los números y los límites de aceptación correspondientes:

    #let n = 40
    #let r_dash = example_2_11_values.sum() / n
    #let alpha = 0.05
    #let quad_devitation = example_2_11_values.map(r_i => (calc.pow((r_i - r_dash), 2))).sum()

    $V(r) = (limits(sum)_(i=1)^n (r_i - dash(r))^2)/(n - 1) = V(r)$
    $= (limits(sum)_(i=1)^#n (r_i - #fmt4(r_dash))^2)/(#n - 1)$ \ \
    $V(r) = 1 / #(n - 1) #fmt4(quad_devitation) approx #fmt4(quad_devitation / (n - 1))$ \ \
    $L S_(V(r)) = (chi^2_(alpha\/2, n - 1)) / (12(n - 1))$ = $(chi^2_(#alpha\/2, #(n - 1))) / (12(#(n - 1)))$
    $= 58.1200541 / #(12 * (n - 1))$
    $= #(58.1200541 / (12 * (n - 1)))$ $approx #fmt4((58.1200541 / (12 * (n - 1))))$ \ \
    $L I_(V(r)) = (chi^2_((1 - alpha)\/2, n - 1)) / (12(n - 1))$
    $= (chi^2_(#(1 - alpha)\/2, #(n - 1))) / (12(#(n - 1)))$
    $= 23.6543003 / #(12 * (n - 1))$
    $= #(23.6543003 / (12 * (n - 1))) approx #fmt4((23.6543003 / (12 * (n - 1))))$

    Dado que el valor de la varianza : $V(r) = #(quad_devitation / (n - 1))$ está entre
    los límites de aceptación, podemos decir que no se puede rechazar que el conjunto
    de $40$ números $r_i$ tiene una varianza de $1\/2 = #fmt4(1 / 12)$
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [pg.~36--37])
  ]
}
