from kafka import KafkaProducer
producer = KafkaProducer(bootstrap_servers='broker')
while 1:
	producer.send('generation', value=input('message: ').rstrip('\n').encode('utf-8'))
