#!/bin/bash

source "../.env"

HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
    "name": "${CONTAINER_NAME}",
    "config": {
		  "name": "${CONTAINER_NAME}",
		  "connector.class": "com.github.shmoli.kafka.connect.source.metricsapi.MetricsAPISourceConnector",
		  "tasks.max": "1",
		  "key.converter": "org.apache.kafka.connect.json.JsonConverter",
		  "key.converter.schema.registry.url": "${SCHEMA_REGISTRY_URL}",
		  "value.converter": "org.apache.kafka.connect.json.JsonConverter",
		  "value.converter.schemas.enable": false,
		  "value.converter.schema.registry.url": "${SCHEMA_REGISTRY_URL}",
		  "value.converter.schemas.enable": false,
		  "errors.log.enable": true,
		  "errors.log.include.messages": true,
		  "ccloud.user.id": "${CCLOUD_USER_ID}",
		  "ccloud.user.password": "${CCLOUD_USER_PASSWORD}",
		  "ccloud.cluster.id": "${CCLOUD_CLUSTER_ID}",
		  "ccloud.topic.level.metrics": true,
		  "kafka.topic.name": "${KAFKA_TOPIC_NAME}",
		  "value.converter.basic.auth.credentials.source": "USER_INFO",
		  "value.converter.basic.auth.user.info": "${SCHEMA_REGISTRY_BASIC_AUTH}",
		  "key.converter.basic.auth.credentials.source": "USER_INFO",
	      "key.converter.basic.auth.user.info": "${SCHEMA_REGISTRY_BASIC_AUTH}"
    }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors
