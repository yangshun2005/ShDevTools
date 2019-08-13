#!/bin/bash

for id in $( docker images -a -q ); do 
	echo "Attempting to remove $id"
	docker rmi $id || true
done
