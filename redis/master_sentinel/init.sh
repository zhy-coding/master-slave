#!/bin/bash

cd redis/
docker compose up -d
ip_address=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' redis-master)
echo "$ip_address"
sed -e 's/@ip_address/'"$ip_address"'/g' ../sentinel/sentinel.conf > ../sentinel/sentinel1.conf
sed -e 's/@ip_address/'"$ip_address"'/g' ../sentinel/sentinel.conf > ../sentinel/sentinel2.conf
sed -e 's/@ip_address/'"$ip_address"'/g' ../sentinel/sentinel.conf > ../sentinel/sentinel3.conf
cd ../sentinel
docker compose up -d
rm sentinel1.conf sentinel2.conf sentinel3.conf



