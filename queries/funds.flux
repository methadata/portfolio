// get fund share value by ISIN

isin = "LU0389811885"

from(bucket: "funds")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) =>
    r.ISIN == isin
  )