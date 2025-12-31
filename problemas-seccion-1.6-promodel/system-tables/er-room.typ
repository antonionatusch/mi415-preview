#import "lib.typ": mk_system_cells, system_table

#let hospital_system_table() = {
  let hospital_entities = ("Doctores", "Pacientes", "Enfermeros", "Asistentes")
  let hospital_events_now = ("Médicos trabajando", "Pacientes atendidos")
  let hospital_events_future = (
    "Cambio de turnos doctores, asistentes",
    "Llegadas de pacientes con mayor gravedad",
  )
  let hospital_states = (
    "Usuarios atendidos",
    "Usuarios en espera",
    "Usuarios dados de alta",
    "Doctores en el turno",
    "Asistentes en el turno",
    "Enfermeros en el turno",
  )
  let hospital_locations = (
    "Sala de espera",
    "Consultorio",
    "Recepción",
    "Estacionamiento",
    "Pabellón de internos",
  )
  let hospital_resources = ("Camillas", "Camas", "Instrumentos médicos", "Medicamentos", "Mesas")
  let hospital_attributes = (
    "Experiencia de los doctores, enfermeros y camilleros",
    "Excelente atención hacia los pacientes",
    "Higiene",
    "Rapidez al atender a los pacientes",
  )
  let hospital_vars_cont = ("Horario del turno del personal", "Costo de los medicamentos")
  let hospital_vars_disc = ("Número de doctores en servicio", "Cantidad de pacientes")

  scale(x: 90%, y: 90%)[
    #system_table(
      ..mk_system_cells(
        entities: hospital_entities,
        events_now: hospital_events_now,
        events_future: hospital_events_future,
        states: hospital_states,
        locations: hospital_locations,
        resources: hospital_resources,
        attributes: hospital_attributes,
        vars_cont: hospital_vars_cont,
        vars_disc: hospital_vars_disc,
        min_rows: 6,
      ),
    )
  ]
}
