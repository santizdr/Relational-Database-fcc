#! /bin/bash

echo -e "\n~~~~~ My salon ~~~~~\n"

MAIN_MENU() {
  echo -e "Welcome to my salon, how can I help you?\n"
  SERVICES=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
        then
        echo "$SERVICE_ID) $NAME"
      fi
    done
  echo -e "\nSelect a service:"
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  case $SERVICE_ID_SELECTED in
    1) GET_APPOINTMENT $SERVICE_ID_SELECTED $SERVICE_NAME ;;
    2) GET_APPOINTMENT $SERVICE_ID_SELECTED $SERVICE_NAME ;;
    3) GET_APPOINTMENT $SERVICE_ID_SELECTED $SERVICE_NAME ;;
    4) GET_APPOINTMENT $SERVICE_ID_SELECTED $SERVICE_NAME ;;
    *) MAIN_MENU ;;
  esac
}

GET_APPOINTMENT() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
    then
    # get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert customer
    INSERT_NEW_CUSTOMER=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  fi
  CUSTOMER_ID=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  echo "What time would you like your appointment,$CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$(psql --username=freecodecamp --dbname=salon --tuples-only -c "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$1,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $2 at $SERVICE_TIME, $CUSTOMER_NAME."
  EXIT
}

EXIT() {
  echo "See you then!"
}

MAIN_MENU
