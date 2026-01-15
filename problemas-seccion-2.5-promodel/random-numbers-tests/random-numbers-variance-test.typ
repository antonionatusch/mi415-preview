#import "../problem-tables-numbers/example-2.11-values.typ": *
#import "../problem-tables-numbers/algorithms.typ": *
#let BOOK_PATH = "../../books/libro-02-simulacion-promodel-garcia-garcia-cardenas.pdf"

#let values_as_table(values: array) = {
  set text(size: 9pt)
  align(center)[
    #table(
      columns: 10,
      align: center,
      inset: 3pt,
      stroke: 0.6pt,
      ..values.map(x => [#fmt4(x)]),
    )
  ]
}

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
    #let my_alpha = 0.05
    #let quad_deviation = example_2_11_values.map(r_i => (calc.pow((r_i - r_dash), 2))).sum()

    $V(r) = (limits(sum)_(i=1)^n (r_i - dash(r))^2)/(n - 1) = V(r)$
    $= (limits(sum)_(i=1)^#n (r_i - #fmt4(r_dash))^2)/(#n - 1)$ \ \
    $V(r) = 1 / #(n - 1) #fmt4(quad_deviation) approx #fmt4(quad_deviation / (n - 1))$ \ \
    $L S_(V(r)) = (chi^2_(alpha\/2, n - 1)) / (12(n - 1))$ = $(chi^2_(#my_alpha\/2, #(n - 1))) / (12(#(n - 1)))$
    $= 58.1200541 / #(12 * (n - 1))$
    $= #(58.1200541 / (12 * (n - 1)))$ $approx #fmt4((58.1200541 / (12 * (n - 1))))$ \ \
    $L I_(V(r)) = (chi^2_((1 - alpha)\/2, n - 1)) / (12(n - 1))$
    $= (chi^2_(#(1 - my_alpha)\/2, #(n - 1))) / (12(#(n - 1)))$
    $= 23.6543003 / #(12 * (n - 1))$
    $= #(23.6543003 / (12 * (n - 1))) approx #fmt4((23.6543003 / (12 * (n - 1))))$

    Dado que el valor de la varianza: $V(r) = #(quad_deviation / (n - 1))$ está entre
    los límites de aceptación, podemos decir que no se puede rechazar que el conjunto
    de $40$ números $r_i$ tiene una varianza de $1\/12 = #fmt4(1 / 12)$.
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [pg.~36--37])

    *Ejemplo propio*

    Genere $n = 30$ números con el algoritmo de Blum, Blum y Shub y realice la prueba
    de varianza. Utlice $X_0 = 69421, m = 2048 "y" alpha = 5% quad ("i.e." 0.05)$.
    #let x_0 = 69421
    #let m = 2048
    #let my_alpha = 0.05
    #let n = 30

    #let (x_numbers, r_numbers) = blum_blum_generator(x_0: x_0, m_param: m, n_terms: 30)
    #let r_dash = r_numbers.sum() / n
    #let quad_deviation = r_numbers.map(r_i => (calc.pow((r_i - r_dash), 2))).sum()


    *1. Números $X_i$ generados:*

    #values_as_table(values: x_numbers)

    *2. Números $r_i$ generados:*

    #values_as_table(values: r_numbers)

    *3. Calculando varianza:*

    $dash(r) = #(r_numbers.sum() / n)$ \ \
    $V(r) = 1 / #(n - 1) #fmt4(quad_deviation) = #(quad_deviation / (n - 1)) approx #fmt4(quad_deviation / (n - 1))$ \ \

    *4. Calculando límites de aceptación inferior y superior:* \ \
    $L S_(V(r)) = (chi^2_(#my_alpha\/2, #(n - 1)))/(12 (#(n - 1)))$ \ \
    $L S_(V(r)) = 45.722/#(12 * (n - 1))$
    $= #(45.722 / (12 * (n - 1))) approx #fmt4(45.622 / (12 * (n - 1)))$ \ \
    $L I_(V(r)) = (chi^2_(#(1 - my_alpha)\/2, #(n - 1)))/(12 (#(n - 1)))$ \ \
    $L I_(V(r)) = 17.708/#(12 * (n - 1))$
    $= #(17.708 / (12 * (n - 1))) approx #fmt4(17.708 / (12 * (n - 1)))$ \ \

    *5. Conclusión*

    Dado que el valor de la varianza: $V(r) = #(quad_deviation / (n - 1))$ está entre
    los límites de aceptación, podemos decir que no se puede rechazar que el conjunto
    de $30$ números $r_i$ tiene una varianza de $1\/12 = #fmt4(1 / 12)$.
  ]
}
