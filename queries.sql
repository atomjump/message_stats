-- To use these queries, you must have MySQL database access to your AtomJump Messaging --
-- database (command line or some other method) --

-- Get a list of the most popular forums in the last week --
SELECT int_layer_id, COUNT(var_shouted) AS shout_count, date_when_shouted FROM tbl_ssshout WHERE date_when_shouted >= curdate() - INTERVAL DAYOFWEEK(curdate())+6 DAY GROUP BY int_layer_id ORDER BY shout_count DESC;

-- And get details of a particular forum with e.g. --
SELECT * FROM tbl_layer WHERE int_layer_id = 19;

