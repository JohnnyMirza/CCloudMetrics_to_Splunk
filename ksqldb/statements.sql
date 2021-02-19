-------Create New Stream-----

CREATE STREAM CCloudMetrics (
    name VARCHAR,
    long_name VARCHAR,
    timestamp BIGINT,
    groupby_name VARCHAR,
    groupby_value VARCHAR,
    dimensions STRUCT<cluster_id VARCHAR,
                        `topic`  VARCHAR,
                        host VARCHAR>,
    `values` STRUCT<doubleValue BIGINT>
  ) WITH (
    KAFKA_TOPIC = 'CCloudMetrics',
    VALUE_FORMAT = 'JSON'
  );

-------Create Auth Stream-----

CREATE STREAM Storage AS select * from  CCLOUDMETRICS
WHERE NAME='io.confluent.kafka.server/retained_bytes'
EMIT CHANGES;

-------Create Retained Bytes Stream-----


