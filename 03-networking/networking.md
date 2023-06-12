
# Networking 


AWS initial lecture we saw VPC is created with network of 10.0.0.0/16 and subnets are created for each zone. We will discuss what is meant by subnets in this chapter. 

## Addresses

Each computer on the network needs address to communicate with each other. There is a particular format to give address, it is 32 bit address and it looks like 10101111110000101101111000001011 and in decimal for the above address is 2948783627. 

 1. It is impossible to remember 32 bit binary or decimal number
 2. We split 32 bits into 4 8 bits binary 10101111 11000010 11011110 00001011 and dot between them instead of space.
 3. The above number now is 175.194.222.11
 4. Each 8 bits maximum it can have is 255 (if all the bits are one's)


If two hosts has addresses 172.16.1.190 and 210.211.14.189 and needs to communicate each other is a huge problem because each host need to maintain $2^{32}$ addresses. Similar to PIN code where one whole area gets single pinched, we divided 32 bit address to network part and host part.

 - 172.16.100.0/24 means first 24 bits belong to network. 172.16.100 is part of network and you can host host address from 1 to 255. (255 can't be assigned we cover later).
 - 10;0.0.0/8 means you can have addresses from 10.1.1.1 to 10.255.255.255
 
# LAN

Office or home office has 5-200 computers, one will buy single switch (with 24 or 48 network ports) or few of switches and arranged in a rack.
![cisco switch](./ciscoswitch1.jpg)

A rack of switches
![Rack of switches](./ciscoswitch2.jpeg)

 - Hosts in a stack of switches can't have address like 172.16.100.120 and 192.168.1.20
 - All addresses of hosts connected to the above switch or rack of switches need to have same subnet meaning like 172.16.100.0/24 range only. It can have 172.16.100.1 to 172.16.100.254
 - All hosts in that range we call it same broadcast address. The broadcast address is 172.16.100.255 (so it is reserved address)
 - No need of any routing to communicate with in subnet. Host sends traffic to switch, switch routes it to the correct host.
 - Each node we have to identify free IP address and assign IP address to the host (How this process will be simplified we cover in later sections)
 - We need to manage table of hosts<---> Ip address table 

# Divide LAN

We have lan with 172.16.100.0/24 address and 254 hosts can be arranged. We would like to split administrative network and business network.
172.16.100 is fixed as it is part of network. We have 00000000 (8 of them) in our control and divide fixing first one zero 0XXXXXXX or fixing first one as one 1XXXXXXX. 
172.16.100.0XXXXXXX - One subnet
172.16.100.1XXXXXXX - Another subnet
172.16.100.1..127 network has 25 bits network and 7 bits for hsot
172.16.100.128..255 is another network

We call such network 172.16.100.0/25 subnet (two of such one with leading zero and another leading one).
Divide switches and no interconnection for one subnet to another subnet.
172.16.100.22 host can communicate to 172.16.100.101 host
172.16.100.145 host can communicate to 172.16.100.222 host

How to make communication from one LAN to and another LAN (Here LAN or local area network is loosely used rather 172.16.100.0/25 networks)

 1. Interconnect switches of 172.16.100.0/25 to 172.16.100.1/25
 2. One switch has address 172.16.100.1 and another has 172.16.100.128 interconnect

Interconnection of switches are not enough, you need to provide something on each host.

 - Host can communicate with in broadcast address, outside of the broadcast address they can't communicate
 - 172.16.100.15 host communication with 172.16.100.145 (two different broadcast addresses). Send data to 172.16.100.1 to communicate to 172.16.100.1/25 addresses
 - 172.16.100.198 can communicate to 172.16.100.19 via 172.16.100.128 only
 - 172.16.100.1 and 172.16.100.128 can forward to other networks
 - Routing table entry on each 172.16.100.0/25 network is route add 172.16.100.128/25 gw 172.16.100.1
 - This is also called routing table.
 - If we have more complex routes routing table has more entries
 - All routing table entries are very complex and one IP changes we need to modify on each node.

## Default gateway and DHCP

Many a times we may not have complex subnets, hosts need to communicate any other node outside of the broadcast address.
We add route add 0.0.0.0/0 gw 172.16.100.1
What this routing entry saying is any thing other than 172.16.100.x broadcast address send it to 172.16.100.1. We call this gateway default gateway as it is default route.
We covered all aspects but how the name resolution happens? How does www.google.co.in translates to Ip address? We need to find DNS resolvers and keep it in each host file dns hosts.

We got lot of management to do and revise it

 - Host to IP address mapping needs to be done
 - Gateway IP address need to be added with route entry
 - DNS resolver entries are kept in each host
 - If any thing changes we need to modify in all hosts

DHCP or dynamic Host configuration protocol will configured on one host (or at home on the router) which provides all these entries like default gateway, dns resolvers etc.
Laptop or mobile wifi is connected, wifi router provides all the above in the background.

## Private addresses

Original idea of network is divide 32 bits some as 8 bits network (for very big corporations), 16 bits for some (for mid size companies 65K addresses) and 24 bits network (for 255 hosts) and this kind of division resulting wastage of addresses. We divide 26 or 28 or any way we wanted. Example let us divide 172.16.100.0/26 addresses
26 means first three 8 bits fixed.

I will give this as exercise how this division happens.

All addresses need not be on the internet, some addresses can be configured for only private they can't be routed via public network. (what is public network and private network?)

 - 10.0.0.0/8 (means 10.0.0.0 to 10.255.255.255 addresses)
 - 172.16.0.0/12
 - 192.168.0.0/16

10.0.0.0/8 is big address space, we can use subnet methods described above to further subnetnet thousands of subnet. Let us see few of them.
10.1.0.0/16 subnet we can take, this too ver big and subdivide as
10.1.0.0/24 (with addresses 10.1.0.1 to 254)
10.1.1.0/24 (with addresses 10.1.1.1 to 254)
10.1.2.0/24 (with addresses 10.1.2.1 to 254)
10.1.3.0/24 9with address 10.1.3.1 to 254)
etc


## Revise what is learned

 - Subnet and broadcast range 
 - Subnet dividing further subnets
 - Routing table and gateway
 - Default gateway and DNS resolvers
 - DHCP - Managing all the above
 - Private address space

