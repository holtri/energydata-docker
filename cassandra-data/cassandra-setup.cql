CREATE  KEYSPACE IF NOT EXISTS energydata WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor' : 1 };

CREATE TABLE IF NOT EXISTS energydata.generation (
    ts timestamp,
	type text,
    region text,
    value double,
    PRIMARY KEY ((region, type), ts)
) WITH CLUSTERING ORDER BY (ts DESC)
AND compaction = {'class': 'DateTieredCompactionStrategy'};

CREATE TABLE IF NOT EXISTS energydata.weather_station (
	id text,
	lon double,
	lat double,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS energydata.weather_sensor (
	id text,
	sensor text,
	value double,
	ts timestamp,
    PRIMARY KEY ((id, sensor), ts)
) WITH CLUSTERING ORDER BY (ts DESC)
AND compaction = {'class': 'DateTieredCompactionStrategy'};