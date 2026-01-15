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
    anexos del libro. #cite(<garcia2013simpromodel>, form: "normal", supplement: [pg.~36--37])<chi-squared-dist-tables>



    #for p in (337, 338) {
      image(BOOK_PATH, page: p, width: 100%)
      pagebreak()
    }
    (Estas tablas fueron extraídas del apéndice en las páginas 335 y 336 del libro
    de #cite(<garcia2013simpromodel>, form: "full"))<chi-squared-dist-tables>
  ]
}
