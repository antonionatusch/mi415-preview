#let cover_page(upsa_logo, student_full_name, course_code, course_full_name, student_code, student_major_name, task_number) = {
  page(footer: none, numbering: none)[
    #align(center + horizon)[
      #text(size: 24pt, weight: "bold")[Tarea #task_number]
      #v(1em)
      #figure(image(upsa_logo, width: 70%))
      #v(1em)
      #text(
        size: 18pt,
        weight: "bold",
      )[#student_full_name \ #course_code - #course_full_name \  #student_code \ #student_major_name]
    ]
  ]
}
