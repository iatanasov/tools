#!/bin/bash
echo "Fetch the tools repository"
cd /opengrok/opengrok-tools/ && git pull
echo "Update the source code repositories"
/opengrok/opengrok-tools/opengrok_repos.py -d /opengrok/src -p /opengrok/opengrok-tools/projects
echo "Run the indexer"
/opengrok/opengrok-tools/index.sh
