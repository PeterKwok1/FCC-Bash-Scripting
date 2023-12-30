#!/bin/bash
# Program to tell a persons fortune
echo -e "\n~~ Fortune Teller ~~\n"

RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")

N=$(( $RANDOM % 6 ))

: '
GET_FORTUNE() {
    if [[ ! $1 ]]
      then
        echo Ask a yes or no question:
      else
        echo Try again. Make sure it ends with a question mark:
    fi 
    read QUESTION
    echo -e "\n${RESPONSES[$N]}"
}

until [[ $QUESTION =~ \?$ ]]
  do
    GET_FORTUNE again
  done
'

# My version 
: '
1. Ask for question 
2. Get question
3. If not a question, explain, get question again.
'

: '
GET_FORTUNE_2() {
  echo Ask a yes or no question:
  until [[ $QUESTION =~ \?$ ]]
    do 
      read QUESTION
      if ! [[ $QUESTION =~ \?$ ]]
        then
          echo Try again. Make sure it ends with a question mark:
      fi
    done
  echo -e "\n${RESPONSES[$N]}"
}

GET_FORTUNE_2
'

# Version 2 
: '
1. Ask for question 
2. Get question
3. If not a question, explain, repeat.
'

GET_FORTUNE_2() {
  echo Ask a yes or no question:
  read QUESTION
  if ! [[ $QUESTION =~ \?$ ]]
    then 
      echo Try again. Make sure it ends with a question mark:
      GET_FORTUNE_2
    else
    echo -e "\n${RESPONSES[$N]}"
    fi
}

GET_FORTUNE_2