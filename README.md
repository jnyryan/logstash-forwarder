# logstash-forwarder

build and install the logstash-forwarder from source in a Vagrant VM

Todo: upload a deb to repo
Create a docker container

## Installation

Install VagrantUp
clone this repo
run `vagrant up`

to access the new VM 
run `vagrant ssh'



## References
https://github.com/elasticsearch/logstash-forwarder

# Troubleshooting

Issue
Failed to tls handshake with 127.0.0.1 x509: certificate is valid for , not localhost
Resolution
I was told on IRC that this was caused by forwarder and indexer using a mismatch of TLS/SSL versions. I downloaded Java from java.com and can confirm that using Oracle Java 1.7.0_45 completes the TLS handshake without problems. Thanks to "whack" for his time and immediate attention into this problem.