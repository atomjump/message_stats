-- To use these queries, you must have MySQL database access to your AtomJump Messaging --
-- database (command line or some other method) --

-- Get a list of the most popular forum IDs in the last week --
SELECT int_layer_id, COUNT(var_shouted) AS shout_count, date_when_shouted FROM tbl_ssshout WHERE date_when_shouted >= curdate() - INTERVAL DAYOFWEEK(curdate())+6 DAY GROUP BY int_layer_id ORDER BY shout_count DESC;

-- And get details of a particular forum with e.g. --
SELECT * FROM tbl_layer WHERE int_layer_id = 19\G


-- Get combined top 20 list
SELECT tbl_ssshout.int_layer_id, tbl_layer.var_title, COUNT(tbl_ssshout.var_shouted) AS shout_count, MAX(tbl_ssshout.date_when_shouted) AS last_message FROM tbl_ssshout LEFT JOIN tbl_layer ON tbl_ssshout.int_layer_id = tbl_layer.int_layer_id WHERE date_when_shouted >= curdate() - INTERVAL DAYOFWEEK(curdate())+6 DAY GROUP BY int_layer_id ORDER BY shout_count DESC LIMIT 20;