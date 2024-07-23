#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICE_MENU() {
  SERVICES=$($PSQL "select * from services")
  echo "$SERVICES" | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done
  echo -e "\nEnter a service"
  read SERVICE_ID_SELECTED
  SERVICE_ID=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID ]]
  then
    SERVICE_MENU
  fi
}

SERVICE_MENU
SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
SERVICE_NAME=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
echo "Enter your phone"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
  echo "Enter your name"
  read CUSTOMER_NAME
  CUSTOMER_INSERT_RESULT=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
fi
CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')
echo "Insert time"
read SERVICE_TIME
APP_INSERT_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."