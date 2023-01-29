# message_stats

__WARNING: this project has now moved to https://src.atomjump.com/atomjump/message_stats.git__

Statistical reports for an AtomJump Messaging installation


It needs some basic command-line technical skills, still, and is particularly useful for tracking whole installations, and the most popular groups.

You must be able to access the raw MySQL database file and be familiar with writing SQL queries.

Typical steps would be:

```
linux command line> mysql -u root -p
[enter database password]
use atomjump;			[or your database name]

#Get a list of the most popular 20 forums in the last week
SELECT tbl_ssshout.int_layer_id, tbl_layer.var_title, COUNT(tbl_ssshout.var_shouted) AS shout_count, MAX(tbl_ssshout.date_when_shouted) AS last_message FROM tbl_ssshout LEFT JOIN tbl_layer ON tbl_ssshout.int_layer_id = tbl_layer.int_layer_id WHERE date_when_shouted >= curdate() - INTERVAL DAYOFWEEK(curdate())+6 DAY GROUP BY int_layer_id ORDER BY shout_count DESC LIMIT 20;
```

And then further queries are available in the file queries.sql.

## Future development

* We will need to build a more extensive interface and provide other approaches to detection, also.
