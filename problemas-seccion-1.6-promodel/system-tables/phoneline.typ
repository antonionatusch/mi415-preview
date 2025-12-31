#import "lib.typ": mk_system_cells, system_table

#let phoneline_system_table() = {
  let phoneline_entities = ("Operadores", "Clientes", "Supervisores")
  let phoneline_events_now = ("Llamadas atendidas", "Llamadas en espera")
  let phoneline_events_future = ("Nuevas llamadas entrantes", "Cambio de turno de operadores")
  let phoneline_states = (
    "Operadores disponibles",
    "Operadores ocupados",
    "Clientes en espera",
    "Llamadas atendidas",
  )
  let phoneline_locations = ("Centro de llamadas", "Área de descanso", "Oficina del supervisor")
  let phoneline_resources = ("Líneas telefónicas", "Computadoras", "Software de gestión de llamadas")
  let phoneline_attributes = (
    "Tiempo de servicio",
    "Banda ancha telefónica",
    "Utilización",
    "Saturación",
    "Pérdida de paquetes",
  )
  let phoneline_vars_cont = ("Tiempo de espera", "Tiempo de servicio", "Latencia")
  let phoneline_vars_disc = (
    "# clientes en espera",
    "# operadores ocupados",
    "# operadores libres",
    "# consultas realizadas",
  )

  scale(x: 90%, y: 90%)[
    #system_table(
      ..mk_system_cells(
        entities: phoneline_entities,
        events_now: phoneline_events_now,
        events_future: phoneline_events_future,
        states: phoneline_states,
        locations: phoneline_locations,
        resources: phoneline_resources,
        attributes: phoneline_attributes,
        vars_cont: phoneline_vars_cont,
        vars_disc: phoneline_vars_disc,
        min_rows: 6,
      ),
    )
  ]
}
