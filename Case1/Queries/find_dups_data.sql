WITH duplicate_ids AS (
  SELECT ride_id
  FROM `capstone-511823.cyclistic_raw_data.cleaned_cyclistic_data`
  GROUP BY ride_id
  HAVING COUNT(ride_id) > 1
)

SELECT *
FROM `capstone-511823.cyclistic_raw_data.cleaned_cyclistic_data`
WHERE ride_id IN (SELECT ride_id FROM duplicate_ids)
ORDER BY ride_id DESC;
