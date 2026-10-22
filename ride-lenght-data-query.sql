select
--unmark day_of_week to show the differnce between riding based on the day of the week
CASE day_of_week
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
  END AS day_name,
member_casual,
ROUND(avg(ride_length_minutes), 2) as avg_ride_length,
max(ride_length_minutes) as max_ride,
COUNT(ride_id) as total_trips,
from
`capstone-511823.cyclistic_raw_data.cleaned_cyclistic_data`
--where ride_length_minutes > 0 and ride_length_minutes < 1440
group by  member_casual, day_of_week
order by member_casual, day_of_week asc;