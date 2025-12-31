#import "lib.typ": mk_system_cells, system_table

#let bank_system_table() = {
  let bank_entities = ("Cajeros", "Clientes", "Guardias")
  let bank_events_now = ("Atención en ventanilla", "Depósitos", "Retiros")
  let bank_events_future = ("Llegada de clientes", "Cambio de turno", "Cierre de caja")
  let bank_states = ("Clientes en cola", "Cajeros ocupados", "Clientes atendidos", "Cajeros libres")
  let bank_locations = ("Entrada", "Área de espera", "Ventanillas", "Oficina del gerente")
  let bank_resources = ("Cajas", "Sistema bancario", "Cámaras", "Efectivo")
  let bank_attributes = ("Tiempo de servicio", "Seguridad", "Capacidad de atención")
  let bank_vars_cont = ("Tiempo de espera", "Tiempo de servicio", "Costo operativo")
  let bank_vars_disc = ("# clientes en cola", "# cajeros activos", "# transacciones")

  scale(x: 90%, y: 90%)[
    #system_table(
      ..mk_system_cells(
        entities: bank_entities,
        events_now: bank_events_now,
        events_future: bank_events_future,
        states: bank_states,
        locations: bank_locations,
        resources: bank_resources,
        attributes: bank_attributes,
        vars_cont: bank_vars_cont,
        vars_disc: bank_vars_disc,
        min_rows: 6,
      ),
    )
  ]
}
