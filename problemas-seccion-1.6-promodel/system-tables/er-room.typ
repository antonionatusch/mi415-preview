#import "lib.typ": mk_system_cells, system_table

#let er_room_system_table() = {
  let er_room_entities = ("Doctores", "Pacientes", "Enfermeros", "Asistentes")
  let er_room_events_now = ("Médicos trabajando", "Pacientes atendidos")
  let er_room_events_future = (
    "Cambio de turnos doctores, asistentes",
    "Llegadas de pacientes con mayor gravedad",
  )
  let er_room_states = (
    "Usuarios atendidos",
    "Usuarios en espera",
    "Usuarios dados de alta",
    "Doctores en el turno",
    "Asistentes en el turno",
    "Enfermeros en el turno",
  )
  let er_room_locations = (
    "Sala de espera",
    "Consultorio",
    "Recepción",
    "Estacionamiento",
    "Pabellón de internos",
  )
  let er_room_resources = ("Camillas", "Camas", "Instrumentos médicos", "Medicamentos", "Mesas")
  let er_room_attributes = (
    "Experiencia de los doctores, enfermeros y camilleros",
    "Excelente atención hacia los pacientes",
    "Higiene",
    "Rapidez al atender a los pacientes",
  )
  let er_room_vars_cont = ("Horario del turno del personal", "Costo de los medicamentos")
  let er_room_vars_disc = ("Número de doctores en servicio", "Cantidad de pacientes")

  scale(x: 90%, y: 90%)[
    #system_table(
      ..mk_system_cells(
        entities: er_room_entities,
        events_now: er_room_events_now,
        events_future: er_room_events_future,
        states: er_room_states,
        locations: er_room_locations,
        resources: er_room_resources,
        attributes: er_room_attributes,
        vars_cont: er_room_vars_cont,
        vars_disc: er_room_vars_disc,
        min_rows: 6,
      ),
    )
  ]
}
