#import "lib.typ": mk_system_cells, system_table

#let hospital_system_table() = {
  let hospital_entities = (
    "Doctores",
    "Cirujanos",
    "Secretarias",
    "Guardias",
    "Farmacéuticos",
    "Enfermeros",
    "Pacientes",
    "Conserjes",
  )
  let hospital_events_now = (
    "Pacientes internados",
    "Secretarias realizando check-in",
    "Guardias supervisando",
    "Enfermeros cuidando pacientes",
    "Doctores atendiendo consulta",
    "Farmacéuticos vendiendo medicamentos",
    "Pacientes haciendo fila en farmacia",
    "Cirujanos operando",
    "Conserjes limpiando",
  )
  let hospital_events_future = (
    "Llegadas de pacientes a urgencias",
    "Ocupación de consultorio",
    "Liberación de consultorio",
    "Cambio de turno de doctores, cirujanos, enfermeros",
    "Dadas de alta",
  )
  let hospital_states = (
    "Pacientes atendidos",
    "Pacientes en espera",
    "Pacientes dados de alta",
    "Habitaciones limpias",
    "Doctores, cirujanos, secretarias, enfermeros, conserjes, guardias, farmacéuticos en turno",
    "Habitaciones ocupadas",
    "Habitaciones libres",
  )
  let hospital_locations = (
    "Sala de espera",
    "Consultorio",
    "Estacionamiento",
    "Recepción",
    "Depósito",
    "Habitación",
    "Farmacia",
    "Unidad de Terapia Intensiva",
    "Sala de cirugía",
    "Caseta de guardia",
    "Sala de cámaras de seguridad",
    "Sala de descanso",
    "Baños",
  )
  let hospital_resources = (
    "Camillas",
    "Camas",
    "Instrumentos médicos",
    "Medicamentos",
    "Mesas",
    "Puntos de venta",
    "Artículos de limpieza",
    "Artículos de seguridad",
    "Herramientas quirúrgicas",
    "Indumentaria quirúrgica",
    "Sillas",
    "Sillones",
    "Lavabos",
    "Inodoros",
  )
  let hospital_attributes = (
    "Años de experiencia",
    "Calidad de atención hacia los pacientes",
    "Higiene",
    "Rapidez al atender las consultas",
    "Tamaño de la camilla",
    "Tamaño de la cama",
    "Tamaño de la habitación",
    "Tamaño del consultorio",
  )
  let hospital_vars_cont = (
    "Tiempo promedio por consulta, operación, atención",
    "Tiempo promedio de espera",
    "Edad promedio de los pacientes",
    "Número promedio de pacientes atendidos por día",
    "Número promedio de pacientes dados de alta por día",
    "Cantidad promedio de medicamentos utilizados por día",
    "Costo promedio por paciente atendido",
    "Costo promedio de operación",
    "Costo promedio de medicamentos por paciente",
  )
  let hospital_vars_disc = (
    "Pacientes atendidos en un día",
    "Consultas realizadas",
    "Operaciones realizadas",
    "Ventas de medicamentos realizadas en un día",
    "Número de pacientes dados de alta",
  )

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
