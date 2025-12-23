import gleam/float
import gleam/int
import gleam/list
import gleam/result
import gleam/set

pub fn main() {
  let nums = list.range(2, 100)
  {
    use acc1, x <- list.fold(nums, set.new())
    use acc2, y <- list.fold(nums, acc1)
    int.power(x, int.to_float(y))
    |> result.unwrap(0.0)
    |> float.round()
    |> set.insert(acc2, _)
  }
  |> set.size
  |> echo
}
