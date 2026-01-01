#import "lib.typ": mk_system_cells, system_table

// El proceso de pintura de un automóvil
#let car_painting_system_table() = {
  let car_painting_entities = (
    "Pintor automotriz",
    "Supervisor de Pintura",
    "Cliente",
    "Brazos robóticos",
    "Pistolas de pintura",
  )
  let car_painting_events_now = (
    "Automóvil siendo pintado",
    "Pintor pintando",
    "Supervisor controlando",
    "Brazos en movimiento",
    "Pistolas de pintura pintando",
    "Motor giratorio encendido",
    "Plataforma giratoria en acción",
  )
  let car_painting_events_future = (
    "Pintura aplicada al automóvil",
    "Pintor libre",
    "Control terminado",
    "Brazos en reposo",
    "Pistolas de pintura en su sitio",
    "Motor en reposo",
    "Plataforma giratoria en reposo",
  )
  let car_painting_states = (
    "Cliente atendido",
    "Supervisor en el turno",
    "Pintor en el turno",
    "Plataforma giratoria encendida",
    "Fase de control en proceso",
    "Brazos encendidos",
    "Plataforma giratoria activa",
    "Automóvil sin pintar",
    "Automóvil pintado",
  )
  let car_painting_locations = (
    "Plataforma de pintura",
    "Depósito",
    "Cabina de Pintura",
    "Horno de Secado",
    "Zona de Mezcla",
  )
  let car_painting_resources = (
    "Secadoras",
    "Hornos",
    "Plataformas",
    "Brazos roboóticos",
    "Pistolas de pintura",
    "Equipamiento de Seguridad",
  )
  let car_painting_attributes = (
    "Color, peso, tamaño, cilindraje del motor",
    "Diámetro de plataforma",
    "Presión emitida de la pistola",
    "Color, peso de la pintura",
  )
  let car_painting_vars_cont = (
    "Costo promedio por automóvil pintado",
    "Tiempo promedio por automóvil",
    "Pintura promedio utilizada por automóvil",
    "Peso promedio del automóvil",
    "Horas de activación de brazos giratorios",
    "Temperaturas máximas y mínimas de los hornos",
    "Tiempo de activación de las secadoras",
  )
  let car_painting_vars_disc = (
    "Automóviles pintados",
    "Número de pintores en servicio",
    "Cantidad de clientes",
    "Fallas de las secadoras, hornos, plataformasl, brazos robóticos",
  )

  scale(x: 90%, y: 90%)[
    #system_table(
      ..mk_system_cells(
        entities: car_painting_entities,
        events_now: car_painting_events_now,
        events_future: car_painting_events_future,
        states: car_painting_states,
        locations: car_painting_locations,
        resources: car_painting_resources,
        attributes: car_painting_attributes,
        vars_cont: car_painting_vars_cont,
        vars_disc: car_painting_vars_disc,
        min_rows: 6,
      ),
    )
  ]
}
