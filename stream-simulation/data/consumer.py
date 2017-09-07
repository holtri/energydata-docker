from kafka import KafkaConsumer
consumer = KafkaConsumer('generation', group_id='consumerGroupA', bootstrap_servers='broker')
for message in consumer:
        print ("%s:%d:%d    %s" % (message.topic, message.partition, message.offset, message.value.decode('utf-8')))
