select
case month
    when 1 then "January"
    when 2 then "February"
    when 3 then "March"
    when 4 then "April"
    when 5 then "May"
    when 6 then "June"
    when 7 then "July"
    when 8 then "August"
    when 9 then "September"
    when 10 then "October"
    when 11 then "November"
    when 12 then "December"
  end as month_name,
count(*) as trip_count,
countif(member_casual = "member") as member_trips,
countif(member_casual = "casual") as casual_trips,
from `capstone-511823.cyclistic_raw_data.cleaned_cyclistic_data`
group by month
order by trip_count desc