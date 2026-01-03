#import "lib.typ": mk_system_cells, system_table

#let emergency_answer_system_table() = {
  let emergency_answer_system_entities = (lorem(2))
  let emergency_answer_system_events_now = (lorem(2))
  let emergency_answer_system_events_future = (lorem(2))
  let emergency_answer_system_states = (lorem(2))
  let emergency_answer_system_locations = (lorem(2))
  let emergency_answer_system_resources = (lorem(2))
  let emergency_answer_system_attributes = (lorem(2))
  let emergency_answer_system_vars_cont = (lorem(2))
  let emergency_answer_system_vars_disc = (lorem(2))

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
