# SmsEvents

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## ngrok

`ngrok http 4000 --subdomain=${USER/./}-idiophone --region=eu`


## Installation

Install Kafka: `brew install kafka`

Configure Kafka: uncomment `delete.topic.enable=true` in `/usr/local/etc/kafka/server.properties`

```shell
export KAFKA_HOME=/usr/local/Cellar/kafka/1.1.0

# Start Zookeper
zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties

# and Kafka
kafka-server-start /usr/local/etc/kafka/server.properties
```

Setup topic:

```shell
# Create a new topic called 'test'
$KAFKA_HOME/bin/kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 2 --topic sms_received

# List out the topics in the local Kafka instance
$KAFKA_HOME/bin/kafka-topics --list --zookeeper localhost:2181

# Logs are in /usr/local/var/lib/kafka-logs
```
