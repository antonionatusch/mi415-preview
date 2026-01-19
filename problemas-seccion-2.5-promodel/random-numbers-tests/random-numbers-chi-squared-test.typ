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
  ]
}
