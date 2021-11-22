#!/bin/sh

target=$1
interface=$2

export SOURCE_INTERFACE=$interface

source_ip=`/sbin/ifconfig $interface | awk -F ' *|:' '/inet /{print $3}'`

export SOURCE_IP=$source_ip

dublin-traceroute -o trace.json $target

python3 -m dublintraceroute plot trace.json

cp trace.json.png /output/trace.png

cp trace.json /output/