CREATE EXTENSION pg_stat_monitor;
SET pg_stat_monitor.pgsm_track='all';
SELECT pg_stat_monitor_reset();

CREATE OR REPLACE FUNCTION test() RETURNS VOID AS
$$
BEGIN
	PERFORM 1 + 2;
END; $$ language plpgsql;

CREATE OR REPLACE FUNCTION test2() RETURNS VOID AS
$$
BEGIN
	PERFORM 1 + 2;
END; $$ language plpgsql;

SELECT pg_stat_monitor_reset(); 
SELECT test(); 
SELECT test2();  	

SELECT 1 + 2;
SELECT left(query, 15) as query, calls, top_query, pgsm_query_id FROM pg_stat_monitor ORDER BY query, top_query COLLATE "C";

DROP EXTENSION pg_stat_monitor;