#import "lib.typ": mk_system_cells, system_table

// El proceso de pintura de un automóvil
#let car_painting_system_table() = {
  let car_painting_entities = ()
  let car_painting_events_now = ()
  let car_painting_events_future = ()
  let car_painting_states = ()
  let car_painting_locations = ()
  let car_painting_resources = ()
  let car_painting_attributes = ()
  let car_painting_vars_cont = ()
  let car_painting_vars_disc = ()

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
