#import "lib.typ": mk_system_cells, system_table

// La recepción de un lathe_workshop
#let lathe_workshop_system_table() = {
  let lathe_workshop_entities = ("Mecánico", "Clientes", "Jefe de Maquinaria", "Tornero Fresador")
  let lathe_workshop_events_now = ("Mecánico trabajando", "")
  let lathe_workshop_events_future = ()
  let lathe_workshop_states = ()
  let lathe_workshop_locations = ()
  let lathe_workshop_resources = ()
  let lathe_workshop_attributes = ()
  let lathe_workshop_vars_cont = ()
  let lathe_workshop_vars_disc = ()

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
