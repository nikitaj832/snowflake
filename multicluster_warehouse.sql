CREATE OR REPLACE WAREHOUSE MY_WH
  WITH WAREHOUSE_SIZE = 'MEDIUM'          -- bigger than X-SMALL/SMALL
  WAREHOUSE_TYPE = 'STANDARD'             -- can also be 'SNOWPARK-OPTIMIZED'
  AUTO_SUSPEND = 300                      -- suspend after 5 mins idle
  AUTO_RESUME = TRUE                      -- auto resume when a query arrives
  INITIALLY_SUSPENDED = TRUE
  MIN_CLUSTER_COUNT = 2                   -- minimum clusters (for base load)
  MAX_CLUSTER_COUNT = 5                   -- max clusters (for peak load)
  SCALING_POLICY = 'ECONOMY';             -- or 'STANDARD 

  USE WAREHOUSE my_wh;