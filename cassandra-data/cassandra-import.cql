
COPY energydata.generation (ts,region,type,value) from '/energydata/de_generation.csv' with HEADER=true AND DELIMITER=',';

COPY energydata.weather_station (id,lon,lat) from '/energydata/weather_station.csv' with HEADER=true AND DELIMITER=',';

COPY energydata.weather_sensor (id,sensor,value,ts) from '/energydata/weather_sensor.csv' with HEADER=true AND DELIMITER=',';
