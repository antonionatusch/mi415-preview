#import "../problem-tables-numbers/example-2.11-values.typ": *
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
    de #cite(<garcia2013simpromodel>, form: "full"))<z-dist-tables>

    *Ejemplo*

    Considere los 40 números del conjunto r_i que se presente a continuación,
    y determine si tienen un valor esperado de $1/2$ con un nivel de aceptación
    de $95%$
    #example_2_11_values_table()

    El conjunto $r_i$ contiene $40$ números, por lo tanto, $n = 40$.
    Un nivel de aceptación de $95%$ implica que $alpha = 5%$.
    Enseguida procedemos a calcular el promedio de los números
    y los límites de aceptación:

    $dash(r) = 1/n limits(sum)_(i=1)^n r_i = 1/40 limits(sum)_(i=1)^40 r_i$


    #let example_2_11_numbers_sum = example_2_11_values.sum()
    #let example_2_11_numbers_avg = example_2_11_numbers_sum / 40
    $dash(r) = #example_2_11_numbers_avg approx #fmt4(example_2_11_numbers_avg)$

    _*Nota de autor:* Este valor difiere del valor calculado en el libro
    de $0.43250$ puesto que #cite(<garcia2013simpromodel>, form: "author") mostró
    los valores redondeados a 4 decimales, mientras que realizó el cálculo
    con todos los decimales del número generado. Se utilizará el valor
    calculado en estos apuntes para los cálculos subsiguientes._

    #let example_2_11_inferior_limit_result = 1 / 2 - 1.96 * (1 / calc.sqrt(12 * 40))
    #let example_2_11_superior_limit_result = 1 / 2 + 1.96 * (1 / calc.sqrt(12 * 40))

    $L I_(dash(r)) = 1/2 - z_(alpha\/2)(1/(sqrt(12n))) = 1/2 - z_(0.05\/2)(1/sqrt(12(40)))$ \ \
    $L I_(dash(r)) = 1/2 - (1.96)(1/(sqrt(12(40)))) = #example_2_11_inferior_limit_result approx fmt4(#example_2_11_inferior_limit_result)$

    $L S_(dash(r)) = 1/2 + z_(alpha\/2)(1/(sqrt(12n))) = 1/2 + z_(0.05\/2)(1/sqrt(12(40)))$ \ \
    $L S_(dash(r)) = 1/2 + (1.96)(1/(sqrt(12(40)))) = #example_2_11_superior_limit_result approx fmt4(#example_2_11_superior_limit_result)$

    Como el valor del promedio $dash(r) = #example_2_11_numbers_avg$ se encuentra
    entre los límites de aceptación, se concluye que no se puede rechazar que
    el conjunto de 40 números $r_i$ tiene un valor esperado de $0.5$,
    con un nivel de aceptación de $95%$.

    *Recordatorio:* El valor de $1.96$ proviene de utilizar la tabla de la
    página 332 del libro, de la siguiente manera:

    #align(center)[
      1. *Restar el nivel de confianza dado de 1 para encontrar alfa:* $ alpha = 1 - N C, quad "e.g." alpha = 1 - 0.95 = 0.05 $ \
      2. *Dividir entre 2 el resultado:* $ alpha/2 = 0.05/2 = 0.025 $ \
      3. *Buscar* $1 - alpha / 2$ *si la tabla da el área desde la media hacia la derecha o* \
      $0.5 + alpha / 2$ *si la tabla da el área hacia la izquierda* \
      4. *Buscar el valor en la tabla Z* (e.g. $0.9750$) *dentro del cuerpo de la tabla* \ \
      5. *Sumar el valor provisto por la fila y la columna de la celda que contiene ese valor*
      (e.g. el el valor de Z que contiene la fila donde está el valor de $0.9750$ es $1.90$ y la columna es $0.06$, entonces)
      $ "Valor" z_("fila")(0.9750) = 1.90 \ "Valor" z_("columna")(0.9750) = 0.06 \ "Valor" z_(alpha/2) = 1.90 + 0.06 = 1.96 $.
    ]
  ]
}
