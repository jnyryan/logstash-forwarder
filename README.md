# logstash-forwarder

This is a VagrantUp virtual machine that builds and installs the logstash-forwarder from [source](https://github.com/elasticsearch/logstash-forwarder/releases)

Todo: upload a deb to repo
Create a docker container

## Installation

Install VagrantUp
clone this repo
run `vagrant up`

to access the new VM 
run `vagrant ssh'


# Package a PPA

Create a Launchpad Account. (https://login.launchpad.net/)
Activate a PPA. (https://launchpad.net/people/+me/)
You can only activate a PPA if you have signed the Ubuntu code of conduct. (https://launchpad.net/codeofconduct)
What are PPAs and how do I use them?
Uploading your source packages.

http://packaging.ubuntu.com/html/getting-set-up.html
http://packaging.ubuntu.com/html/packaging-new-software.html


## References
https://github.com/elasticsearch/logstash-forwarder

# Troubleshooting

Issue
Failed to tls handshake with 127.0.0.1 x509: certificate is valid for , not localhost
Resolution
I was told on IRC that this was caused by forwarder and indexer using a mismatch of TLS/SSL versions. I downloaded Java from java.com and can confirm that using Oracle Java 1.7.0_45 completes the TLS handshake without problems. Thanks to "whack" for his time and immediate attention into this problem.

Issue
clearsign failed: secret key not available
debsign: gpg error occurred!  Aborting….

Resolution
http://blog.gauner.org/blog/2010/12/06/debsign-clearsing-failed-secret-key-not-available/

Issue
Section Unknown

Resolution
http://manpages.ubuntu.com/manpages/natty/man5/deb-control.5.html

Issue
Unmet build dependencies: go
Resolution
Update debian/control
Build-Depends: debhelper (>= 9.0.0), golang
