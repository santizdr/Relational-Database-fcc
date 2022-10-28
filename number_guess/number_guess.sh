#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))


# extract user_id from database if already exists
USERNAME_FROM_DB=$($PSQL "SELECT name FROM usuarios WHERE name = '$USERNAME'")
# if the user is not registered
if [[ -z $USERNAME_FROM_DB ]]
then 
  # echo welcome message and insert user into database
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT_USER=$($PSQL "INSERT INTO usuarios(name) VALUES('$USERNAME')")
else
  PLAYED_GAMES=$($PSQL "SELECT num_games FROM usuarios WHERE name = '$USERNAME'")
  BEST_GAME_GUESSES=$($PSQL "SELECT best_game FROM usuarios WHERE name = '$USERNAME'")
  echo Welcome back, $USERNAME! You have played $PLAYED_GAMES games, and your best game took $BEST_GAME_GUESSES guesses.
fi

VICTORY=$false
GUESS_COUNTER=0

echo Guess the secret number between 1 and 1000:

while [[ $VICTORY != 'true' ]]
do
  read GUESS
  GUESS_COUNTER=$(($GUESS_COUNTER+1))
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then 
    if [[ $GUESS -lt $RANDOM_NUMBER ]]
    then 
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $RANDOM_NUMBER ]]
      then
      echo "It's lower than that, guess again:"
    else
      echo You guessed it in $GUESS_COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!
      VICTORY='true'
    fi
  else
    echo That is not an integer, guess again:
  fi
done

GET_PLAYED_GAMES=$($PSQL "SELECT num_games FROM usuarios WHERE name = '$USERNAME'")
INCREMENT_PLAYED_GAMES=$(($GET_PLAYED_GAMES+1))
UPDATE_PLAYED_GAMES=$($PSQL "UPDATE usuarios SET num_games = $INCREMENT_PLAYED_GAMES WHERE name='$USERNAME'")
GET_BEST_GAME=$($PSQL "SELECT best_game FROM usuarios WHERE name = '$USERNAME'")
if [[ -z $GET_BEST_GAME ]]
then 
  INSERT_BEST_GAME=$($PSQL "UPDATE usuarios SET best_game = $GUESS_COUNTER WHERE name='$USERNAME'")
else
  if [[ $GET_BEST_GAME -gt $GUESS_COUNTER ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE usuarios SET best_game = $GUESS_COUNTER WHERE name='$USERNAME'")
  fi
fi
