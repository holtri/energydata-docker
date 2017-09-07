import time
from kafka import KafkaProducer
producer = KafkaProducer(bootstrap_servers="broker")
with open("data/wind_trimmed.csv", "r") as windFile:
        with open("data/solar_trimmed.csv", "r") as solarFile:
                for _ in range(75000):
                        windvalues = windFile.readline().rstrip("\n").split(",")
                        windString = "{ \"ts\": \""+windvalues[0]+"\", \"type\": \""+windvalues[1]+"\", \"region\": \""+windvalues[2]+"\", \"value\": \""+windvalues[3]+"\" }"
                        producer.send("generationIngress", key=b"0", value=windString.encode("utf-8"))
                        producer.send('generation', key=b'0', value=(windvalues[0]+','+windvalues[1]+','+windvalues[2]+','+windvalues[3]).encode('utf-8'))
                        solarvalues = solarFile.readline().rstrip("\n").split(",")
                        solarString = "{ \"ts\": \""+solarvalues[0]+"\", \"type\": \""+solarvalues[1]+"\", \"region\": \""+solarvalues[2]+"\", \"value\": \""+solarvalues[3]+"\" }"
                        producer.send("generationIngress", key=b"1", value=solarString.encode("utf-8"))
                        producer.send('generation', key=b'1', value=(solarvalues[0]+','+solarvalues[1]+','+solarvalues[2]+','+solarvalues[3]).encode('utf-8'))
                        time.sleep(1)
