#let BOOK_PATH = "../../books/libro-02-simulacion-promodel-garcia-garcia-cardenas.pdf"
#let random_numbers_mean_test = {
  [
    Una de las propiedades que deben cumplir los números del conjunto "r_i"
    es que el valor esperado sea igual a 0.5.
    La prueba que busca determinar lo anterior es la llamada _prueba de medias,_ en la cual se
    plantean las siguientes hipótesis:

    $ H_0 : mu_r_i = 0.5 $
    $ H_1 : mu_r_i != 0.5 $

    La prueba de medias consiste en determinar el promedio de los $n$ números que contiene
    el conjunto $r_i$, mediante la ecuación siguiente:

    $ dash(r) = 1/n limits(sum)_(i=1)^n r_i $

    Después se calculan los límites de aceptación inferior y superior con las ecuaciones
    siguientes:

    $ L I_(dash(r)) = 1/2 - z_(alpha\/2) (sqrt(1/(12n))) $
    $ L S_(dash(r)) = 1/2 + z_(alpha\/2) (sqrt(1/(12n))) $

    Si el valor de $dash(r)$ se encuentra entre los límites de aceptación, concluimos que
    no se puede rechazar la hipótesis nula $H_0$ y, por lo tanto, los números del conjunto $r_i$
    pueden considerarse aleatorios.

    Para el cálculo de los límites de aceptación, se utiliza el estadístico
    $ z_(alpha\/2) $, que se obtiene de la tabla de la distribución normal estándar:
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~35])

    #for p in (334, 335) {
      image(BOOK_PATH, page: p, width: 100%)
      pagebreak()
    }

    (Estas tablas fueron extraídas del apéndice en las páginas 332 y 333 del libro
    de #cite(<garcia2013simpromodel>, form: "full"))
  ]
}
