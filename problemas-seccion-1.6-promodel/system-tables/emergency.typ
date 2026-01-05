#import "lib.typ": mk_system_cells, system_table

#let emergency_answer_system_table() = {
  let emergency_answer_system_entities = (
    "Personas que llaman al número de emergencia",
    "Operadores de la línea de emergencia",
    "Vehículos de emergencia",
    "Personal médico y de rescate",
  )
  let emergency_answer_system_events_now = (
    "Llamada entrante al número de emergencia",
    "Asignación de operador a la llamada",
    "Despacho de vehículo de emergencia",
    "Llegada al lugar del incidente",
    "Atención de la emergencia",
    "Finalización del servicio de emergencia",
  )
  let emergency_answer_system_events_future = (
    "Emergencia resuelta",
    "Reporte post-emergencia",
    "Seguimiento del caso",
    "Vehículo de emergencia regresa a la base",
  )
  let emergency_answer_system_states = (
    "Llamada en espera",
    "Operador asignado",
    "Vehículo en tránsito",
    "Emergencia en curso",
    "Emergencia resuelta",
    "Reporte generado",
  )
  let emergency_answer_system_locations = (
    "Centro de llamadas de emergencia",
    "Ubicación del incidente",
    "Hospital o centro médico",
    "Base de vehículos de emergencia",
    "Oficina administrativa del sistema de emergencias",
  )
  let emergency_answer_system_resources = (
    "Líneas telefónicas",
    "Operadores capacitados",
    "Vehículos de emergencia (ambulancias, patrullas, bomberos)",
    "Equipos médicos y de rescate",
    "Sistemas de comunicación y despacho",
  )
  let emergency_answer_system_attributes = (
    "Tiempo de respuesta",
    "Capacidad de manejo de llamadas simultáneas",
    "Calidad del servicio al cliente",
    "Eficiencia en la asignación de recursos",
    "Cobertura geográfica del sistema de emergencias",
  )
  let emergency_answer_system_vars_cont = (
    "Tiempo promedio de respuesta",
    "Costo operativo del sistema de emergencias",
  )
  let emergency_answer_system_vars_disc = (
    "Número de operadores disponibles",
    "Cantidad de vehículos de emergencia en servicio",
    "Número de emergencias atendidas por día",
    "Tipos de emergencias (médicas, incendios, policiales)",
  )

  scale(x: 90%, y: 90%)[
    #system_table(
      ..mk_system_cells(
        entities: emergency_answer_system_entities,
        events_now: emergency_answer_system_events_now,
        events_future: emergency_answer_system_events_future,
        states: emergency_answer_system_states,
        locations: emergency_answer_system_locations,
        resources: emergency_answer_system_resources,
        attributes: emergency_answer_system_attributes,
        vars_cont: emergency_answer_system_vars_cont,
        vars_disc: emergency_answer_system_vars_disc,
        min_rows: 6,
      ),
    )
  ]
}
