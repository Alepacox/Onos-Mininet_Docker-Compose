1. Access to Onos bash and go to the folder /onos-apps
```
$ docker exec -it onos-c bash
$ cd onos-apps
```
2. Create a new app
```
$ onos-create-app app org.foo foo-app 1.0-SNAPSHOT org.foo.app
```
3. From Windows, access to the folder onos-apps of this directory. 
  You will now find a new folder, called _foo-app_. Open it with an IDE, like Intellij, and you can modify it as you want.

4. Build your application within the controller with the following commands:
```
$ docker exec -it onos-c bash
$ cd onos-apps/foo-app
$ mvn clean install
```
5. Install you app in the controller:
```
onos-app -u root -p karaf localhost install! target/foo-app-1.0-SNAPSHOT.oar
```

Your app is now installed and fully working on the controller!
