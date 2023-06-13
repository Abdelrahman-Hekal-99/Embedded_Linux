#!/bin/bash


ADDRESS_BOOK_FILE="address_book.txt"

function display_menu() {
  clear
  echo "*************************************"
  echo "***** Author :Abdelrahman Hekal *****"
  echo "***** Project : Address Book    *****"
  echo "*****        WELCOME            *****"
  echo "*************************************"
  echo "1 - List/Search"
  echo "2 - Add"
  echo "3 - Edit"
  echo "4 - Remove"
  echo "5 - Quit"
  echo -n "Please enter your selection: "
  read choice
}

function list_contacts() {
  clear
  echo "Contacts in the address book:"
  echo "-----------------------------"
  grep -i "$query" "$ADDRESS_BOOK_FILE"
  read -p "Press enter to continue"
}


function add_contact() {
  clear
  echo "Add a new contact:"
  echo "------------------"
  echo -n "Name: "
  read name
  echo -n "Phone: "
  read phone
  echo "$name,$phone" >> "$ADDRESS_BOOK_FILE"
  echo "Contact added successfully."
  read -p "Press enter to continue"
}

function edit_contact() {
  clear
  echo "Edit a contact:"
  echo "---------------"
  echo -n "Enter the name of the contact to edit: "
  read name
  line=$(grep -i "^$name," "$ADDRESS_BOOK_FILE")
  if [[ -z "$line" ]]; then
    echo "Contact not found."
  else
    echo "Current phone number: $(echo $line | cut -d',' -f2)"
    echo -n "Enter the new phone number: "
    read phone
    sed -i "s/^$name,.*/$name,$phone/" "$ADDRESS_BOOK_FILE"
    echo "Contact edited successfully."
  fi
  read -p "Press enter to continue"
}


function remove_contact() {
  clear
  echo "Remove a contact:"
  echo "-----------------"
  echo -n "Enter the name of the contact to remove: "
  read name
  line=$(grep -i "^$name," "$ADDRESS_BOOK_FILE")
  if [[ -z "$line" ]]; then
    echo "Contact not found."
  else
    sed -i "/^$name,/d" "$ADDRESS_BOOK_FILE"
    echo "Contact removed successfully."
  fi
  read -p "Press enter to continue"
}

while true; do
  display_menu
  case "$choice" in
    1)
      echo -n "Enter a name or phone number to search: "
      read query
      list_contacts
      ;;
    2)
      add_contact
      ;;
    3)
      edit_contact
      ;;
    4)
      remove_contact
      ;;
    5)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid selection, please try again."
      read -p "Press enter to continue"
      ;;
  esac
done
