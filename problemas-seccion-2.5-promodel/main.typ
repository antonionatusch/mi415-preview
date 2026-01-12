#import "imports.typ": *
#import "../template/imports.typ": *
#set heading(numbering: "1.1)")
#set text(lang: "es")
#set list(indent: 1cm)

#show heading.where(level: 1): set text(size: 14pt)
#show heading.where(level: 2): set text(size: 12pt)

#cover_page(
  upsa_logo: UPSA_LOGO,
  student_full_name: STUDENT_FULL_NAME,
  course_code: COURSE_CODE,
  course_full_name: COURSE_FULL_NAME,
  student_code: STUDENT_CODE,
  student_major_name: STUDENT_MAJOR_NAME,
  task_number: 2,
)

#pagebreak()
#counter(page).update(1)
#set page(
  header: none,
  footer: context {
    align(center)[#counter(page).display("i")]
  },
)
#outline()

#pagebreak()
#counter(page).update(1)
#show: setup_page.with(
  course_code: COURSE_CODE,
  course_semester: COURSE_SEMESTER,
  task_number: 2,
  student_full_name: STUDENT_FULL_NAME,
  student_code: STUDENT_CODE,
)

#text(size: 14pt)[
  #underline[*Números pseudoaleatorios*]
]

Estos problemas se pueden encontrar en la *sección 2.5* del libro principal de la materia,
de #cite(<garcia2013simpromodel>, form: "prose", supplement: [p.~52--58]),

= Notación y Conceptos
- $r_i = {r_1, r_2, r_3, dots, r_n}$: Secuencia de números aleatorios entre el intervalo $(0,1)$ que contiene $n$ números, todos ellos diferentes.
- $n$: _Período_ o _ciclo de vida_ del generador que creó la secuencia $r_i$.
- $ f(r): cases(
    1"," quad 0 <= r <= 1,
    0"," quad "en cualquier otro valor"
  ) $...distribución uniforme continua que debe seguir un conjunto de $r_i$.
- $N$: Período de vida _bastante grande_ para un generador de números pseudoaleatorios.
- $X_i$: Número entero positivo que se utiliza como semilla o detonador en los algoritmos congruenciales y no congruenciales para generar números pseudoaleatorios.
#cite(<garcia2013simpromodel>, form: "normal", supplement: [p.~22-23])

== Algoritmos no congruenciales
=== Algoritmo de cuadrados medios
#middle_square_method

=== Algoritmo de productos medios
#middle_product_method

=== Algoritmo de multiplicador constante
#constant_multiplier_method

#pagebreak()
== Algoritmos congruenciales lineales
=== Algoritmo lineal
#linear_congruential_method

#pagebreak()
=== Algoritmo congruencial multiplicativo
#multiplicative_congruential_method

=== Algoritmo congruencial aditivo
#additive_congruential_method

#pagebreak()
== Algoritmos congruenciales no lineales
=== Algoritmo congruencial cuadrático
#quadratic_congruential_method

#pagebreak()
=== Algoritmo de Blum, Blum y Shub
#blum_blum_shub_method


#pagebreak()
#bibliography("references/references.bib", style: "american-psychological-association")
