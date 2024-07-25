#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

ELEMENT=$1
if [[ -z $ELEMENT ]]
then
  echo -e "Please provide an element as an argument."
  exit
fi

if [[ $ELEMENT =~ ^[0-9]+$ ]]
then
  TUPLE=$($PSQL "select elements.*, properties.*, types.type from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$ELEMENT")
else
  TUPLE=$($PSQL "select elements.*, properties.*, types.type from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol='$ELEMENT' or name='$ELEMENT'")
fi

if [[ -z $TUPLE ]]
then
  echo "I could not find that element in the database."
  exit
fi
echo "$TUPLE" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_NUMBER BAR MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE_ID BAR TYPE
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done