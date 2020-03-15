echo "Starting Onos And Mininet"

gnome-terminal -- /bin/sh -c "docker-compose up"

# execute apache
sleep 30
while true; do
    read -p "Do you wish to run a random topology? [y/n] " yn
    case $yn in
        [Yy]* ) docker exec -it mininet-c python topology.py;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
