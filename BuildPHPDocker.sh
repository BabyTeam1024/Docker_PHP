#!/bin/bash

cp .docker-compose.yml.bak docker-compose.yml

read -p "Input PHP Version (default php7.0):" phpv
read -p "Open xdebug (default yes):" xdebug
if [ "" = "$xdebug" ]; then
	xdebug="yes"
fi
if [ "" = "$phpv" ]; then
        phpv="php7.0"
fi
sed -i "s/dockername/$phpv/g" docker-compose.yml
echo "php_v=$phpv" > .env
echo "xdebug=$xdebug" >> .env
docker-compose build
