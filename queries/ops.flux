// retrieve total number of shares in each moment, by

isin = "LU0389811885"

from(bucket: "operations")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) =>
    r.ISIN == isin and
    r.user == "fer"
  )|> cumulativeSum()


from(bucket: "operations")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) =>
    r.user == "fer"
  )
 // |> group(columns: ["ISIN"])
  |> cumulativeSum()