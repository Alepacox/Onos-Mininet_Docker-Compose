# Onos-Mininet Docker-compose
The following docker-compose.yml file is used to create, run and make interacting two docker containers: one for ONOS SDN controller, and the other one for Mininet.
Fully working on Windows/MacOS/Linux.

### How does it work?
First you need Docker compose, which relies on Docker engine, and so they both need to be installed.

**[Linux/MacOS section]**
--------------------------------------------
Let's firstly procede with the environment setup
```
$ git clone https://gerrit.onosproject.org/onos
$ cd onos
$ cat << EOF >> ~/.bash_profile
export ONOS_ROOT="`pwd`"
source $ONOS_ROOT/tools/dev/bash_profile
EOF
$ . ~/.bash_profile
$ cd onos
```
Then clone this repository with the following command:
```
git clone https://github.com/Alepacox/Onos-Mininet_Docker-Compose.git
```
After that, move into the cloned folder and run 
```
docker-compose up
```
This will download and run both the containers.

**[Windows section]**
--------------------------------------------
Due to the fact that Onos is not able to run on Windows, I've added some scripts that still enables you to 
recall its main functionalities within the docker:
- Recall Onos CLI (```onos```)
- Recall Onos apps creation script (```onos-create-app```)
- Recall Onos services to install/manage apps (```onos-app```) 

The docker will have a shared folder, called _onos-app_, where you can develop the application (from Windows) that you built with the onos-create-app script from the container.

**How to configure it?**

Clone this repository with the following command:
```
git clone https://github.com/Alepacox/Onos-Mininet_Docker-Compose.git
```
After that, move into the cloned folder and run 
```
docker-compose up
```
This will download and run both the containers.

Once the container is running, run the following command to attach to the ONOS container's bash:
```
docker exec -it onos-c bash
```
And run:
```
./WindowsSetup.sh
```
Once it finished, type _exit_.

[Recap of commands]
--------------------------------------------

 - Access to Onos's shell (password= karaf):
```
[Linux/MacOS]: onos karaf@localhost
[Windows]: docker exec -it onos-c onos
```
 - Create a new app:
```
[Linux/MacOS]: onos-create-app app org.foo foo-app 1.0-SNAPSHOT org.foo.app
[Windows]: 
     $ docker exec -it onos-c bash
     $ cd onos-apps
     $ onos-create-app app org.foo foo-app 1.0-SNAPSHOT org.foo.app
 
(In this way the app will be in the shared folder, where you can modify it on Windows with any IDE)
```
 - Install an app:
 ```
 [Linux/MacOS]:onos-app -u karaf -p karaf localhost install! target/foo-app-1.0-SNAPSHOT.oar
 [Windows]: 
     $ docker exec -it onos-c bash
     $ cd onos-apps/foo-app
     $ onos-app -u root -p karaf localhost install! target/foo-app-1.0-SNAPSHOT.oar
 ```
So basically from Windows you can give direct commands to the container with ```docker exec -it onos-c [command]```
or you can access to the container's bash with ```docker exec -it onos-c bash``` and call commands directly in there.
The second option is preferred when you have to build apps. 

See this example --> [How to create/build/install an app on Windows](https://github.com/Alepacox/Onos-Mininet_Docker-Compose/blob/master/%5BSample%5DCreateApp_Windows.md)

[Mininet]
--------------------------------------------
Then, if you wish to create a random topology**, run in another term window:
```
[Windows/MacOS/Linux]: docker exec -it mininet-c python topology.py
```

**[Linux/MacOS only]** 
I also provided a start.sh script that asks directily if you want to create a new topology** while starting the containers.
(the script refers to gnome terminal: if you don't have it, just replace it with the one that you use)  

** **This requires that the following app are enabled at the Onos controller (disabled by default): OpenFlow Agent, OpenFlow Base Provider and OpenFlow Provider Suite** 

- ONOS Docker image --> [onosproject/onos](https://hub.docker.com/r/onosproject/onos/)
- Mininet Docker image --> [iwaseyusuke/mininet](https://hub.docker.com/r/iwaseyusuke/mininet/)
