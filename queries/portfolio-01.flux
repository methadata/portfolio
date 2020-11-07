// get total value of a given fund in my portfolio
// bug: value is update only when there's a buy operation

isin = "LU0389811885"

ops = from(bucket: "operations")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) =>
    r.ISIN == isin and
    r.user == "fer"
  )|> cumulativeSum()

funds = from(bucket: "funds")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) =>
    r.ISIN == isin
  )

join(
  tables: {d1:ops, d2:funds},
  on: ["_time", "ISIN"]
)
|> map(fn: (r) => ({
  r with
  _value: r._value_d1 * r._value_d2
}))
|> drop(columns: ["_user", "ISIN", "_field_d1", "_field_d1", "_measurement_d1", "_measurement_d2", "_start_d1", "_start_d2", "_stop_d1", "_stop_d2", "user"])

