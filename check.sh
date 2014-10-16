#!/bin/bash

FIRST_DOMAIN=$1
DICT_FILE=$2
FREE_FILE=$3
REGISTERED_FILE=$4
ERROR_FILE=$5

if [ -z "$FIRST_DOMAIN" ] || [ -z "$DICT_FILE" ] || [ -z "$FREE_FILE" ] || [ -z "$REGISTERED_FILE" ] || [ -z "$ERROR_FILE" ]; then
    echo 'Usage: check.sh ru dict.txt free.txt registered.txt error.txt'
    exit 1
fi

for NAME in $(cat "$DICT_FILE")
do
  DOMAIN=$NAME.$FIRST_DOMAIN
  WHOIS=`whois $DOMAIN`
  FREEDATE=`echo $WHOIS | grep 'free-date'`
  NOTFOUND=`echo $WHOIS | grep 'No entries found for the selected source'`
  
  if [ -n "$NOTFOUND" ]; then
    echo $DOMAIN is free
    echo $DOMAIN >> "$FREE_FILE"
  else
    if [ -n "$FREEDATE" ]; then
      echo $DOMAIN is registered
      echo $DOMAIN >> "REGISTERED_FILE"
    else
      echo Whois error
      echo $DOMAIN >> "ERROR_FILE"
    fi
  fi
sleep 4
done