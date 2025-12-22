import gleam/io
import gleam/list
import gleam/int
import gleam/dict
import gleam/result

// The max digit^5 of 6 digits is:
// 9^5 * 6 = 354294
// Even if we get the largest 7 digit number 9999999,
// its sum (9^5 * 7 = 413343) is still only 6 digits.
// So stop at the max 6 digit power sum number
const max_digit_fifth_power = 354294

pub fn main() -> Nil {
  digit_fifth_powers(10, [])
  |> int.sum()
  |> int.to_string()
  |> io.println
}

fn digit_fifth_powers(i: Int, acc: List(Int)) -> List(Int) {
  case i > max_digit_fifth_power {
    True -> acc
    False -> case is_digit_fifth_power(i) {
      True -> {
        // echo i
        [i, ..digit_fifth_powers(i+1, acc)]
      }
      False -> digit_fifth_powers(i+1, acc)
    }
  }
}

fn is_digit_fifth_power(i: Int) -> Bool {
  let powers = dict.from_list([
    #(0, 0),
    #(1, 1),
    #(2, 32),
    #(3, 243),
    #(4, 1024),
    #(5, 3125),
    #(6, 7776),
    #(7, 16807),
    #(8, 32768),
    #(9, 59049),
  ])
  case digits(i, 10) {
    Error(_) -> False
    Ok(i_list) -> {
      let r = list.fold_until(i_list, 0, fn(acc, x) -> list.ContinueOrStop(Int) {
        let p = dict.get(powers,x) |> result.unwrap(0)
        list.Continue(acc+p)
      })
      r == i
    }
  }
}

fn digits(x: Int, base: Int) -> Result(List(Int), Nil) {
  case base < 2 {
    True -> Error(Nil)
    False -> Ok(digits_inner(x, base, []))
  }
}

fn digits_inner(x: Int, base: Int, acc: List(Int)) -> List(Int) {
  case x < base {
    True -> [x, ..acc]
    False -> digits_inner(x / base, base, [x % base, ..acc])
  }
}
