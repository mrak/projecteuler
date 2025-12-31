// import gleam/int
// import gleam/set
// import gleam/result
// import gleam/option.{type Option,Some}
// import gleam/list.{fold, range}
//
// pub fn main() {
//   use product, denominator <- fold(range(99, 11), 1.0)
//   use product, numerator <- fold(range(denominator-1, 10), product)
//   case numerator % 10 == 0 && denominator % 10 == 0 {
//     True -> product
//     False -> case have_common_digit(numerator, denominator) {
//       False -> product
//       True -> case
//     }
//   }
//
//   echo numerator
//   product
// }
//
// fn have_common_digit(x: Int, y: Int) -> Bool {
//   {
//     use x_digits <- result.try(int.digits(x, 10))
//     use y_digits <- result.try(int.digits(y, 10))
//     set.from_list(x_digits)
//     |> set.intersection(set.from_list(y_digits))
//     |> set.size
//     |> fn(s) { s > 0 }
//     |> Ok
//   }
//   |>
//   result.unwrap(False)
// }
