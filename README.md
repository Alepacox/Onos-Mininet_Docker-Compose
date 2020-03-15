# Onos-Mininet Docker-compose
The following docker-compose.yml file is used to create, run and make interacting Onos Docker container and a Mininet one.
Works on Windows/MacOS/Linux.

### How does it work?
First you need Docker compose, which relies on Docker engine, and so you need to be them both installed.
Move to the cloned repo's folder and run 
> docker-compose up

This will download and run both the containers.

Then, if you wish to create a random topology**, run in another term window:

> docker exec -it mininet-c python topology.py

I also provided a START.sh script that asks directily if you want to create a new topology** while starting the containers.
(the script refers to gnome terminal: if you don't have it, just replace it with the one the you use)  

** **This requires that the following app are enabled at the Onos controller (disabled by default): OpenFlow Agent, OpenFlow Base Provider and OpenFlow Provider Suite** 
