#import "../problem-tables-numbers/table-styles.typ": *

#let random_numbers_independence = {
  [
    Esta es una propiedad muy importante, e implica que los números aleatorios no deben
    tener correlación entre sí; es decir, deben ser independientes, de manera
    que puedan disperarse de manera uniforme dentro de todo el espectro de
    valores posibles. La figura 2.2a muestra una gráfica totalmente
    dispersa en los valores posibles, y la figura 2.2b presenta una
    acumulación de los valores en la parte central, lo cual quiere decir que hay una
    correlación entre los mismos.

    #figure(image("../figures/figures-2.2a-2.2b-independence.png", width: 50%), caption: [
      Figuras sobre la independencia de las variables aleatorias, extraidas de #cite(<garcia2013simpromodel>, form: "full", supplement: [p.~34])
    ])
      #cite(<garcia2013simpromodel>, form: "prose", supplement: [p.~34])
  ]
}
