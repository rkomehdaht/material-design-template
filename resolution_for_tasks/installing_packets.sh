#! /usr/bin/env bash
sudo apt-get update && echo "updated"
sudo apt-get install git -y && echo "git installed" || echo "some problems..."
sudo apt-get install nginx -y && echo "nginx installed" || echo "some problems..."
