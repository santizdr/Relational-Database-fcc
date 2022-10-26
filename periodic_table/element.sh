EXIT() {
  echo "I could not find that element in the database."
  exit
}



if [[ -z $1 ]]
then 
  echo Please provide an element as an argument.
else
  LEN=$(expr length $1)
  if [[ $1 =~ ^[0-9]+$ ]]
  then 
    ATOMIC_NUMBER_FROM_INPUT=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT atomic_number FROM elements WHERE atomic_number = $1")
    DATA=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT * FROM elements INNER JOIN properties USING (atomic_number) WHERE atomic_number = $1")
    if [[ -z $ATOMIC_NUMBER_FROM_INPUT ]]
    then
      EXIT
    fi
    echo $DATA | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
    do
    ELEMENT_TYPE=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT type FROM types WHERE type_id = $TYPE_ID")
    ATOMIC_NUMBER_TRIM=$(echo $ATOMIC_NUMBER | sed 's/ *$//g')
    SYMBOL_TRIM=$(echo $SYMBOL | sed 's/ *$//g')
    NAME_TRIM=$(echo $NAME | sed 's/ *$//g')
    ATOMIC_MASS_TRIM=$(echo $ATOMIC_MASS | sed 's/ *$//g')
    MELTING_POINT_TRIM=$(echo $MELTING_POINT | sed 's/ *$//g')
    BOILING_POINT_TRIM=$(echo $BOILING_POINT | sed 's/ *$//g')
    ELEMENT_TYPE_TRIM=$(echo $ELEMENT_TYPE | sed 's/ *$//g')

    echo "The element with atomic number $ATOMIC_NUMBER_TRIM is $NAME_TRIM ($SYMBOL_TRIM). It's a $ELEMENT_TYPE_TRIM, with a mass of $ATOMIC_MASS_TRIM amu. $NAME_TRIM has a melting point of $MELTING_POINT_TRIM celsius and a boiling point of $BOILING_POINT_TRIM celsius."
    done

  elif [[ $LEN == 1 || $LEN == 2 ]]
  then
    ATOMIC_NUMBER_FROM_SYMBOL=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT atomic_number FROM elements WHERE symbol = '$1'")
    if [[ -z $ATOMIC_NUMBER_FROM_SYMBOL ]]
    then
      EXIT
    fi
    DATA=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT * FROM elements INNER JOIN properties USING (atomic_number) WHERE atomic_number = $ATOMIC_NUMBER_FROM_SYMBOL")
    echo $DATA | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
    do
    ELEMENT_TYPE=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT type FROM types WHERE type_id = $TYPE_ID")
    ATOMIC_NUMBER_TRIM=$(echo $ATOMIC_NUMBER | sed 's/ *$//g')
    SYMBOL_TRIM=$(echo $SYMBOL | sed 's/ *$//g')
    NAME_TRIM=$(echo $NAME | sed 's/ *$//g')
    ATOMIC_MASS_TRIM=$(echo $ATOMIC_MASS | sed 's/ *$//g')
    MELTING_POINT_TRIM=$(echo $MELTING_POINT | sed 's/ *$//g')
    BOILING_POINT_TRIM=$(echo $BOILING_POINT | sed 's/ *$//g')
    ELEMENT_TYPE_TRIM=$(echo $ELEMENT_TYPE | sed 's/ *$//g')

    echo "The element with atomic number $ATOMIC_NUMBER_TRIM is $NAME_TRIM ($SYMBOL_TRIM). It's a $ELEMENT_TYPE_TRIM, with a mass of $ATOMIC_MASS_TRIM amu. $NAME_TRIM has a melting point of $MELTING_POINT_TRIM celsius and a boiling point of $BOILING_POINT_TRIM celsius."
    done
  else
    ATOMIC_NUMBER_FROM_NAME=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT atomic_number FROM elements WHERE name = '$1'")
    if [[ -z $ATOMIC_NUMBER_FROM_NAME ]]
    then
      EXIT
    fi
    DATA=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT * FROM elements INNER JOIN properties USING (atomic_number) WHERE atomic_number = $ATOMIC_NUMBER_FROM_NAME")
    echo $DATA | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
    do
    ELEMENT_TYPE=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only -c "SELECT type FROM types WHERE type_id = $TYPE_ID")
    ATOMIC_NUMBER_TRIM=$(echo $ATOMIC_NUMBER | sed 's/ *$//g')
    SYMBOL_TRIM=$(echo $SYMBOL | sed 's/ *$//g')
    NAME_TRIM=$(echo $NAME | sed 's/ *$//g')
    ATOMIC_MASS_TRIM=$(echo $ATOMIC_MASS | sed 's/ *$//g')
    MELTING_POINT_TRIM=$(echo $MELTING_POINT | sed 's/ *$//g')
    BOILING_POINT_TRIM=$(echo $BOILING_POINT | sed 's/ *$//g')
    ELEMENT_TYPE_TRIM=$(echo $ELEMENT_TYPE | sed 's/ *$//g')

    echo "The element with atomic number $ATOMIC_NUMBER_TRIM is $NAME_TRIM ($SYMBOL_TRIM). It's a $ELEMENT_TYPE_TRIM, with a mass of $ATOMIC_MASS_TRIM amu. $NAME_TRIM has a melting point of $MELTING_POINT_TRIM celsius and a boiling point of $BOILING_POINT_TRIM celsius."
    done
  fi
fi
