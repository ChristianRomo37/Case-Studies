 CREATE OR REPLACE TABLE `capstone-511823.cyclistic_raw_data.combined_cyclistic_data` AS (
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-July`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2025-december`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2025-november`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2025-october`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-April`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-August`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-Feburary`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-January`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-June`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-March`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-May`
  UNION ALL
  SELECT * FROM `capstone-511823.cyclistic_raw_data.2026-September`
);
