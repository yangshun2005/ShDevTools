#!/bin/bash

for id in $( docker images -a -q ); do 
	echo "Removing $id"
	docker rmi -f $id
done
