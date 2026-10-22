select
CASE day_of_week
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
  END AS day_name,
count(*) as trip_count,
countif(member_casual = "member") as member_trips,
countif(member_casual = "casual") as casual_trips,
from `capstone-511823.cyclistic_raw_data.cleaned_cyclistic_data`
group by day_of_week
order by trip_count desc