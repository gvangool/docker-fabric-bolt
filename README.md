docker-fabric-bolt
==================
A docker container with fabric-bolt

You could start this in a very basic version via:

    docker run -it --rm --volume=$(pwd)/config:/root/.fabric-bolt --publish=8000:8000 --publish=9000:9000 gvangool/fabric-bolt

This will generate a new config file (on first run) and create the sqlite
database. If you require a real databas, you'll need to install the drivers
and manually edit the settings file.
