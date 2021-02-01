# message_stats
Statistical reports for an AtomJump Messaging installation


It needs some basic command-line technical skills, still, and is particularly useful for tracking whole installations, and the most popular groups.

You must be able to access the raw MySQL database file and be familiar with writing SQL queries.

Typical steps would be:

```
linux command line> mysql -u root -p
[enter database password]
use atomjump;			[or your database name]

#Get a list of the most popular forums in the last week
SELECT int_layer_id, COUNT(var_shouted) AS shout_count, date_when_shouted FROM tbl_ssshout WHERE date_when_shouted >= curdate() - INTERVAL DAYOFWEEK(curdate())+6 DAY GROUP BY int_layer_id ORDER BY shout_count DESC;

#And get details of a particular forum with e.g. (for forum 19)
SELECT * FROM tbl_layer WHERE int_layer_id = 19\G
```

And then further queries are available in the file queries.sql.

## Future development

* We will need to build a more extensive interface and provide other approaches to detection, also.