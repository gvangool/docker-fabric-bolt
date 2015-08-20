docker-fabric-bolt
==================
A docker container with fabric-bolt

You could start this in a very basic version via:

    docker run -it --rm --volume=$(pwd)/config:/root/.fabric-bolt --publish=8000:8000 --publish=9000:9000 gvangool/fabric-bolt

This will generate a new config file (on first run) and create the sqlite
database. If you require a real database, you'll need to install the drivers
and manually edit the settings file.


A more advanced case would be where you run your own fork of the code:

    FROM gvangool/fabric-bolt

    ENV REPO https://github.com/gvangool/fabric-bolt.git
    ENV VERSION 0bb8dadf60ae94ea83cb362203ddce14db8046f0

    RUN cd /src/fabric-bolt && \
        git remote rm origin && \
        git remote add origin ${REPO} && \
        git fetch --all --prune && \
        git checkout ${VERSION} && \
        pip install -e .
