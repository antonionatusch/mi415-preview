#import "lib.typ": mk_system_cells, system_table

// Un taller de tornos
#let lathe_workshop_system_table() = {
  let lathe_workshop_entities = ("Mecánico", "Clientes", "Jefe de Maquinaria", "Tornero Fresador")
  let lathe_workshop_events_now = (
    "Mecánico trabajando",
    "Clientes atendidos",
    "Tornero fresador operando",
    "Jefe de maquinaria supervisando",
    "Máquinas en funcionamiento",
  )
  let lathe_workshop_events_future = ("Cambio de turnos de mecánicos, torneros", "Solicitudes de clientes entrantes")
  let lathe_workshop_states = (
    "Mecánico trabajando",
    "Mecánico libre",
    "Jefe de Maquinaria ocupado",
    "Cliente en espera",
    "Cliente atendido",
    "Tornero Fresador en el turno",
  )
  let lathe_workshop_locations = (
    "Oficina principal",
    "Estacionamiento",
    "Almacén",
    "Estación de trabajo",
    "Sala de Mantenimiento",
    "Sala de Estar",
  )
  let lathe_workshop_resources = (
    "Equipo de seguridad",
    "Fresadoras",
    "Mesas",
    "Instrumentos de medición",
    "Estanterías",
    "Carros de carga",
    "Generadores",
  )
  let lathe_workshop_attributes = (
    "Experiencia del Jefe de Maquinaria, Mecánico, Tornero fresador",
    "Atención al cliente",
    "Estado de la fresadora",
    "Rapidez al atender al cliente",
    "Rapidez al fabricar la pieza",
  )
  let lathe_workshop_vars_cont = (
    "Horas máquina empleadas",
    "Peso medio de piezas fabricadas",
    "Costo hora hombre",
    "Voltios consumidos",
    "Horario del turno de los trabajadores",
    "Tiempo de atención al cliente",
  )
  let lathe_workshop_vars_disc = (
    "Piezas terminadas",
    "Cantidad de clientes atendidos",
    "Número de máquinas disponibles",
    "Número de máquinas ocupadas",
    "Números de máquinas en buen estado",
    "Número de máquinas en mal estado",
    "Número de operarios trabajando",
  )

  scale(x: 90%, y: 90%)[
    #system_table(
      ..mk_system_cells(
        entities: lathe_workshop_entities,
        events_now: lathe_workshop_events_now,
        events_future: lathe_workshop_events_future,
        states: lathe_workshop_states,
        locations: lathe_workshop_locations,
        resources: lathe_workshop_resources,
        attributes: lathe_workshop_attributes,
        vars_cont: lathe_workshop_vars_cont,
        vars_disc: lathe_workshop_vars_disc,
        min_rows: 6,
      ),
    )
  ]
}
