#import "lib.typ": mk_system_cells, system_table

// La recepción de un hotel
#let hotel_system_table() = {
  let hotel_entities = ("Recepcionistas", "Huéspedes", "Personal de limpieza", "Conserjes")
  let hotel_events_now = ("Check-ins en curso", "Check-outs en curso", "Solicitudes de servicio en habitación")
  let hotel_events_future = (
    "Check-in realizado",
    "Check-out realizado",
    "Servicio en habitación realizado",
    "Limpieza post check-out realizada",
  )
  let hotel_states = (
    "Recepcionistas ocupados",
    "Recepcionistas disponibles",
    "Check-in atrasado",
    "Check-out atrasado",
    "Servicio en habitación en proceso",
  )
  let hotel_locations = ("Recepción", "Sala de estar", "Habitación")
  let hotel_resources = ("Ordenadores", "Teléfonos", "Material de limpieza", "Comidas", "Bebidas")
  let hotel_attributes = (
    "Tiempo de respuesta ante solicitud de servicio",
    "Higiene",
    "Satisfacción de los huéspedes",
    "Tiempo de check-in",
    "Tiempo de check-out",
  )
  let hotel_vars_cont = ("Hora del check-in", "Hora del check-out", "Tiempo de servicio de habitación")
  let hotel_vars_disc = ("Huéspedes atendidos", "Habitaciones reservadas", "Habitaciones disponibles")

  scale(x: 90%, y: 90%)[
    #system_table(
      ..mk_system_cells(
        entities: hotel_entities,
        events_now: hotel_events_now,
        events_future: hotel_events_future,
        states: hotel_states,
        locations: hotel_locations,
        resources: hotel_resources,
        attributes: hotel_attributes,
        vars_cont: hotel_vars_cont,
        vars_disc: hotel_vars_disc,
        min_rows: 6,
      ),
    )
  ]
}
