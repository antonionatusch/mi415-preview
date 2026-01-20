#import "../problem-tables-numbers/example-2.13-values.typ": *
#import "../problem-tables-numbers/table-styles.typ": *
#import "../problem-tables-numbers/algorithms.typ": linear_congruential_generator
#let random_numbers_chi_squared_test = {
  [

    La prueba Chi-cuadrada busca determinar si los números del conjunto
    $r_i$ se distribuyen de manera uniforme en el intervalo $(0, 1)$. Para
    llevar a cabo esta prueba es necesario dividir el intervalo $(0, 1)$
    en $m$ sub-intervalos, en donde es recomendable $m = sqrt(n)$.
    Luego se clasifica cada número pseudoaleatorio del conjunto $r_i$
    en los $m$ intervalos. A la cantidad de números $r_i$ que se
    clasifican en cada intervalo se le denomina _frecuencia observada_
    $(O_i)$, y a la cantidad de números $r_i$ que se espera encontrar
    en cada intervalo se le llama frecuencia esperada $(E_i)$;
    teóricamente, la $E_i$ es igual $n\/m$. A partir de los valores
    de $O_i$ y $E_i$ se determina el estadístico $chi^2_0$ mediante la
    ecuación

    $ chi^2_0 = limits(sum)_(i=1)^m (E_i-O_i)^2/E_i $

    Si el valor del estadístico $chi^2_0$ es menor al valor de tablas de
    $chi^2_(alpha, m - 1)$, entonces no se puede rechazar que el conjunto
    de números $r_i$ sigue una distribución uniforme. En caso contrario,
    se rechaza que $r_i$ sigue una distribución uniforme.

    *Ejemplo*

    Realizar la prueba Chi-cuadrada a los siguientes 100 números de un
    conjunto $r_i$ con un nivel de confianza $N C = 95% = 0.95$.

    #example_2_13_values_table()

    Antes de proceder, es recomendable crear una tabla similar a la
    tabla 2.1, en donde se resumen los pasos que deben llevarse
    a cabo en la prueba Chi-cuadrada.

    #let example_2_13_values_n = example_2_13_values.len()
    #let example_2_13_values_m = calc.max(2, int(calc.ceil(calc.sqrt(example_2_13_values_n))))

    *Tabla 2.1* Cálculos para la prueba Chi-cuadrada.
    #chi_squared_table(values: example_2_13_values).render

    #let chi_squared_table_sum = chi_squared_table(values: example_2_13_values).chi_squared_value_sum


    El estadístico $chi^2_0 = limits(sum)_(i=1)^#example_2_13_values_m (E_i - O_i)^2/(E_i)$
    $= #fmt4(chi_squared_table_sum)$
    es menor al estadístico correspondiente de \ la Chi-cuadrada $X^2_(0.05, 9) = 16.9$.
    En consecuencia, no se puede rechazar que los números $r_i$ siguen una
    distribución uniforme.
    #cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~38-39])

    *Ejemplo propio*

    Genere $n = 150$ números pseudoaleatorios utilizando el
    método congruencial lineal con
    $X_0 = 7$, $a = 5$, $c = 3$ y $m = 16$. Realice la prueba
    Chi-cuadrada a los números
    generados con un nivel de confianza $N C = 95% = 0.95$.
    #let x_0 = 7
    #let a_param = 5
    #let c_param = 3
    #let m_param = 16
    #let n = 150
    #let m = calc.sqrt(n)
    #let alpha_value = 0.05

    #let (x_numbers: x_values, r_numbers: r_values) = linear_congruential_generator(
      x_0: x_0,
      a_param: a_param,
      c_param: c_param,
      m_param: m_param,
      n_terms: n,
    )



    *1. Generando números $X_i$:*
    #values_as_table(values: x_values)

    #pagebreak()
    *2. Generando números $r_i$ a partir de los $X_i$:*
    #values_as_table(values: r_values)

    *3. Creando tabla para la prueba Chi-cuadrada:*
    #chi_squared_table(values: r_values).render
    #let my_example_chi_squared_sum = chi_squared_table(values: r_values).chi_squared_value_sum

    *4. Realizando sumatoria:*
    $X_0^2 = limits(sum)_(i=1)^#n (E_i-O_i)^2/E_i = #my_example_chi_squared_sum$

    *5. Encontrando estadístico de $X_(#alpha_value, #fmt4(m - 1) approx 11)$:*
    Según la tabla en la página 335 del libro, el valor es $19.675$.

    *6. Conclusión:*
    Como $#my_example_chi_squared_sum < 19.675$, se concluye que no se puede
    rechazar que los números $r_i$ siguen una distribución
    uniforme.
  ]
}
