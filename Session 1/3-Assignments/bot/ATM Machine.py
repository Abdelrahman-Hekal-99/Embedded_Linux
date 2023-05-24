# Set of valid pin codes
valid_pins = {1234, 5678, 9012}

# Tuple of account balances corresponding to the pin codes
account_balances = (1000, 2000, 3000)

def atm():
    # Ask for pin code
    pin = int(input("Enter your pin: "))
    
    # Check if pin is valid
    if pin in valid_pins:
        # Get the index of the pin in the set
        index = list(valid_pins).index(pin)
        
        # Get the account balance
        balance = account_balances[index]
        
        # Print the balance
        print(f"Your account balance is: {balance}")
        
        # Ask for withdrawal amount
        amount = int(input("Enter the amount you want to withdraw: "))
        
        # Check if there is enough balance
        if amount <= balance:
            # Update the balance
            balance -= amount
            
            # Print the new balance
            print(f"Your new account balance is: {balance}")
        else:
            print("Insufficient funds")
    else:
        print("Invalid pin")

# Run the ATM function
atm()
