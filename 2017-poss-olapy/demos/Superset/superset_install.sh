#!/bin/bash

sudo apt-get install build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev


pip install virtualenv

# virtualenv is shipped in Python 3 as pyvenv
virtualenv superset_venv
./superset_venv/bin/activate

pip install --upgrade setuptools pip


# Install superset
pip install superset

# Initialize the database
superset db upgrade

# Load some data to play with
#superset load_examples

#copy modified superset db
sudo cp -v  superset.db ~/.superset/

# Start the web server on port 8088, use -p to bind to another port
superset runserver
