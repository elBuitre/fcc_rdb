#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

NUMBER=$(($RANDOM%1000+1))
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_RESULT=$($PSQL "insert into users(name) values('$USERNAME')")
  USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
else
  USER_DATA=$($PSQL "select count(game_id), min(guesses) from games where user_id=$USER_ID group by
 user_id")
  echo $USER_DATA
  echo $USER_DATA | while read GAMES BAR BEST
  do
    echo "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
  done
fi
echo "Guess the secret number between 1 and 1000:"
COUNTER=0
while [[ $GUESS != $NUMBER ]]
do
  read GUESS
  COUNTER=$((COUNTER+1))
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS > $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS < $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  fi
done
echo "You guessed it in $COUNTER tries. The secret number was $NUMBER. Nice job!"
INSERT_RESULT=$($PSQL "insert into games(user_id, guesses) values($USER_ID, $COUNTER)")
