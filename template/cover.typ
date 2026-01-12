#let cover_page(
  upsa_logo: str,
  student_full_name: str,
  course_code: str,
  course_full_name: str,
  student_code: str,
  student_major_name: str,
  task_number: int,
) = {
  page(footer: none, numbering: none)[
    #align(center + horizon)[
      #text(size: 24pt, weight: "bold")[Tarea #task_number]
      #v(1em)
      #image(upsa_logo, width: 70%)
      #v(1em)
      #text(
        size: 18pt,
        weight: "bold",
      )[#student_full_name \ #course_code - #course_full_name \  #student_code \ #student_major_name]
    ]
  ]
}
