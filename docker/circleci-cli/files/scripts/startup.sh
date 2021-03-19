#!/usr/bin/env bash

# Set docker socket permissions

sudo groupadd -g 1001 docker
sudo usermod -a -G docker "${USER}"
#sudo newgrp docker

# Return to bash shall

/bin/bash
