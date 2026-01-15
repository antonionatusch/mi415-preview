#let middle_square_generator(x_0: int, n_terms: int) = {
  let d_digits = x_0.to_string().len()
  let format_str = "%" + d_digits.to_string() + "d"

  let generated_x_numbers_array = range(1, n_terms + 1).fold((x_0,), (acc, _) => {
    let prev = acc.at(acc.len() - 1)
    let squared_str = calc.pow(prev, 2).to_string().pad_start(d_digits * 2, "0")
    let start_index = (squared_str.len() - d_digits) / 2
    let middle_digits_str = squared_str.slice(start_index, start_index + d_digits)
    let next = calc.parse_int(middle_digits_str)
    acc + (next,)
  })

  let generated_r_numbers_array = generated_x_numbers_array.map(x_i => x_i / (calc.pow(10, d_digits) - 1))

  (
    x_numbers: generated_x_numbers_array,
    r_numbers: generated_r_numbers_array,
  )
}

#let middle_products_generator(x_0: int, x_1: int, n_terms: int) = {
  let format_str = "%" + d_digits.to_string() + "d"
  let d_digits = x_0.to_string().len()

  let generated_x_numbers_array = range(2, n_terms + 1).fold((x_0, x_1), (acc, _) => {
    let len = acc.len()
    let prev1 = acc.at(len - 1)
    let prev2 = acc.at(len - 2)
    let product_str = (prev1 * prev2).to_string().pad_start(d_digits * 2, "0")
    let start_index = (product_str.len() - d_digits) / 2
    let middle_digits_str = product_str.slice(start_index, start_index + d_digits)
    let next = calc.parse_int(middle_digits_str)
    acc + (next,)
  })

  let generated_r_numbers_array = generated_x_numbers_array.map(x_i => x_i / (calc.pow(10, d_digits) - 1))

  (
    x_numbers: generated_x_numbers_array,
    r_numbers: generated_r_numbers_array,
  )
}

#let constant_multiplier_generator(x_0: int, a_param: int, n_terms: int) = {
  let d_digits = x_0.to_string().len()
  let format_str = "%" + d_digits.to_string() + "d"

  let generated_x_numbers_array = range(1, n_terms + 1).fold((x_0,), (acc, _) => {
    let prev = acc.at(acc.len() - 1)
    let product_str = (a_param * prev).to_string().pad_start(d_digits * 2, "0")
    let start_index = (product_str.len() - d_digits) / 2
    let middle_digits_str = product_str.slice(start_index, start_index + d_digits)
    let next = calc.parse_int(middle_digits_str)
    acc + (next,)
  })

  let generated_r_numbers_array = generated_x_numbers_array.map(x_i => x_i / (calc.pow(10, d_digits) - 1))

  (
    x_numbers: generated_x_numbers_array,
    r_numbers: generated_r_numbers_array,
  )
}

#let linear_congruential_generator(x_0: int, a_param: int, c_param: int, m_param: int, n_terms: int) = {
  let x_1 = calc.rem((a_param * x_0 + c_param), m_param)

  let generated_x_numbers_array = range(2, n_terms + 1).fold((x_1,), (acc, _) => {
    let prev = acc.at(acc.len() - 1)
    let next = calc.rem((a_param * prev + c_param), m_param)
    acc + (next,)
  })

  let generated_r_numbers_array = generated_x_numbers_array.map(x_i => x_i / (m_param - 1))

  (
    x_numbers: generated_x_numbers_array,
    r_numbers: generated_r_numbers_array,
  )
}

#let multiplicative_congruential_generator(x_0: int, a_param: int, m_param: int, n_terms: int) = {
  let x_1 = calc.rem((a_param * x_0), m_param)

  let generated_x_numbers_array = range(2, n_terms + 1).fold((x_1,), (acc, _) => {
    let prev = acc.at(acc.len() - 1)
    let next = calc.rem((a_param * prev), m_param)
    acc + (next,)
  })

  let generated_r_numbers_array = generated_x_numbers_array.map(x_i => x_i / (m_param - 1))

  (
    x_numbers: generated_x_numbers_array,
    r_numbers: generated_r_numbers_array,
  )
}

#let quadratic_congruential_generator(
  x_0: int,
  a_param: int,
  b_param: int,
  c_param: int,
  m_param: int,
  n_terms: int,
) = {
  let x_1 = calc.rem((a_param * calc.pow(x_0, 2) + b_param * x_0 + c_param), m_param)

  let generated_x_numbers_array = range(2, n_terms + 1).fold((x_1,), (acc, _) => {
    let prev = acc.at(acc.len() - 1)
    let next = calc.rem(
      a_param * calc.pow(prev, 2) + b_param * prev + c_param,
      m_param,
    )
    acc + (next,)
  })

  let generated_r_numbers_array = generated_x_numbers_array.map(x_i => x_i / (m_param - 1))

  (
    x_numbers: generated_x_numbers_array,
    r_numbers: generated_r_numbers_array,
  )
}

#let additive_congruential_generator(x_0: int, a_param: int, b_param: int, m_param: int, n_terms: int) = {
  let x_1 = calc.rem((a_param + x_0 + b_param), m_param)

  let generated_x_numbers_array = range(2, n_terms + 1).fold((x_1,), (acc, _) => {
    let prev = acc.at(acc.len() - 1)
    let next = calc.rem((a_param + prev + b_param), m_param)
    acc + (next,)
  })

  let generated_r_numbers_array = generated_x_numbers_array.map(x_i => x_i / (m_param - 1))

  (
    x_numbers: generated_x_numbers_array,
    r_numbers: generated_r_numbers_array,
  )
}

// Same as quadratic but with default parameters
#let blum_blum_generator(x_0: int, a_param: 1, b_param: 0, c_param: 0, n_terms: int, m_param: int) = {
  let (x_numbers: prev_x_numbers, r_numbers: prev_r_numbers) = quadratic_congruential_generator(
    x_0: x_0,
    a_param: a_param,
    b_param: b_param,
    c_param: c_param,
    m_param: m_param,
    n_terms: n_terms,
  )

  (
    x_numbers: prev_x_numbers,
    r_numbers: prev_r_numbers,
  )
}
