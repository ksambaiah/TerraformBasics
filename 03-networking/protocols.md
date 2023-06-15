# Application Layer protocols

Application layer protocols is a mouth watering term, instead of explaining it we examine few of the protocols and reason about them to understand. Some examples of them are http, https, smtp, pip3, imap, ntp, dhcp, ftp, dns and many more we use in our daily when computer operates. 

## What is name for us is number for computer

We understand easily google.com or purdue.edu but difficult to remember 108.177.120.104 or 128.210.7.200, similarly for us http, https or smtp and computer we use numbers (or also called port numbers). Client uses port > 1024 and < 65535 and server mostly runs <=1024. There are close to 1024 protocols, we don't need to learn all of them. We only need handful of them.

Applications communicate to each other, man in the middle can listen on the wire, to solve this problem many protocols come up with idea of encrypting. Not all protocols required such encrypted communication. http - plain and https encrypted same way pop3 and imap and many more protocols. How do they exchange secret key will not be covered here.

Application layer uses TCP (reliable) or UDP for underlying transport. 

### DNS 

Domain name service is such an important protocol with out it net will be useless.
Protocol  UDP
Port          53
There are two components of this protocol we call consumer and producer.
Consumer:
If you are connected to network (wifi or via cable) underlying server gives you dns resolvers via dhcp. In Unix/Linux you can see in /etc/resolv.conf and windows network configuration from gui.
Your computer communicates with rest of the world, it needs some one resolving your domain names. Browser you type google.com or twitter.com or gmail.com it needs to resolve to IP address. Browser or any other service contacts the dns resolver to get IP address. 

Producer:
If you registered domain like xyz.com, you would like to run website, email service to get email sam@xyz.com for this to happen there should be services you need to run.

 - DNS server to tell where is webserver running
 - Email servers
 - Your primary and secondary DNS servers
 - Your primary and secondary DNS servers will be registered with top level domain.

Please find the screenshot of how to interact with dns server (You don't need most of the time)

![enter image description here](file:///dns.png)

### HTTP

http is a well known application protocol, no need to explain further.
Protocl: TCP
Port: 80
Who writes protocols, are there any standard way of client communicating with http server? Every network protocol is defined in RFC (also called Request for comments) and http is defined at [RFC1616](https://datatracker.ietf.org/doc/html/rfc2616)

Apache webserver, nginx or lighttpd or any other webserver has to follow the RFC and implement software accordingly.

HTTP is plain text software and data is not encrypted, https is encrypted and runs on port 443.

### SSH

SSH is used on Linux and Unix like systems to remote access.
Protocol: TCP
Port number: 22
SSH data on the wire is encrypted.
Telnet is protocol similar to SSH, it uses port number 23, after ssh we no longer needed telnet.
SSH is also used to securely copy data, so ftp (with port numbers 21 and 20) also no longer needed.

### SMTP
SMTP stands for simple mail transfer protocol, we don't need to run the service of smtp on our client machines.

Protocol: TCP
Port number: 25, 587
IMAP is accessing mails from remote mail servers, mail clients (Microsoft outlook) uses IMAP to retrieve mails.
Protocol: TCP
Portnumber: 143 (plain text), 993 (encrypted)
Mail retrieval other than IMAP we have POP3
port number: TCP
Port number: 110 (Plain text), 995 (encrypted)

###  Application and Network layers

We covered DNS, http, https, ssh, telnet, smtp, imap, imaps, pop3, pop3s and there are many more such application protocols. Application protocols uses port number to associate and lower level protocol (either TCP or UDP for transport).

## Networking layer

Application layer as name suggests are applications we day to day use like http or imap or ssh. Application layer uses networking layer or transport layer to transfer data.

 - TCP or UDP are protocols TCP is reliable and have overhead UDP for DNS queries or time protocol
 - IP addresses also comes in network layer.

### Firewall rules
You wanted to block all tcp and udp protocols going to IP address 172.16.100.120, since this is single IP it translates to 172.16.100.120/32 A sample rule (varies from one to other)
**iptables -A OUTPUT -d 172.16.100.120/32 -j REJECT**
If you wanted to block all of subnet 172.16.100.0/24
**iptables -A OUTPUT -d 172.16.100.0-/16 -j REJECT**
If we specify protocol only that protocol is blocked, if we specify port number only that port is blocked. If we don't specify for all it will be applied.
Outgoing port 22 for 10.0.0.0/8 network can be blocked like
**iptables -A OUTPUT -D 10.0.0.0/8 -P 22 -j REJECT**
Is it possible to reject blocking faceebook?
Facebook runs on several load balancers, it is difficult to know and block facebook via firewall rules at network level.
**We are asking facebook application using network rules, that is difficult to implement.**
## Proxy servers as firewalls

You would like to block  [facebook](www.facebook.com) how do we do it?

 - It is not possible to find all IP addresses of facebook and block them. It might be but very very difficult.
 - You install a proxy (not firewall) which understands http protocol (so only for http or https) and restrict sites you would like to block (squid proxy is one such thing).

