#!/bin/sh

target=$1

dublin-traceroute -o trace.json $target

python3 -m dublintraceroute plot trace.json

cp trace.json.png /output/trace.png

cp trace.json /output/