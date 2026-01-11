#let setup_page(course_code, course_semester, task_number, student_full_name, student_code, body) = {
  set page(
    footer: context {
      [#student_full_name \ #student_code]
      h(1fr)
      counter(page).display("1")
    },
    header: context {
      [#course_code - #course_semester]
      h(1fr)
      [Tarea #task_number]
      line(length: 100%)
    },
  )
  body
}
