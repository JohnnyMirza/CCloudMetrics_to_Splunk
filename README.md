# Confluent Clound Metrics API Collector - To Splunk

- Collect CCloud Metrics from the Metrics API (V1 at this stage), and prodouce into another cluster/topic. Then Sink to Splunk for Dashboarding.

Kudo's to Oli Watson for creating the source connector. (also reach out to him if you have issue :P): https://www.confluent.io/blog/build-observability-pipelines-with-confluent-cloud-and-appdynamics/


TL;DR
```
QuickStart
1. git clone https://github.com/JohnnyMirza/CCloudMetrics_to_Splunk.git
2. Modify the .env file will all your details
3. docker-compose up -d
4. You can access the local splunk install on http://localhost:8001
