import mysql.connector

mydb = mysql.connector.connect(
host="localhost",
user="root",
password="Takeoutwand73!",
database="pp3")

cursor = mydb.cursor()
    
def purchase():

    #prints the menu
    cursor.execute("SELECT * FROM stock")

    for x in cursor:
        print(x)

    #gets information
    purchase = input("Which product would you like to buy?(select the number)")
    sale_description = input("Enter a description of the sale")
    card_no = input("Enter a 16 digit card number")
    num_in_stock = input("How many are in stock now ?")

    #creates the sale and takes it out of inventory
    cursor.execute("INSERT INTO `pp3`.`sales` (`sale_id`, `sale_description`, `card_no`, `product_id`) VALUES (%s, %s, %s, %s)",(purchase,sale_description,card_no,purchase))
    cursor.execute("UPDATE stock SET num_in_stock = %s WHERE stock_id = %s ", (num_in_stock,purchase)) 
    mydb.commit

def buy():
    
    #prints the menu
    cursor.execute("SELECT * FROM stock")

    for x in cursor:
        print(x)

    #asks user questions
    item = input("which item would you like to buy?")
    cuantos = input("how many would you like to buy?")
    old = input("how many do you currently have in stock?")
    total = int(cuantos) + int(old)

    cursor.execute("UPDATE stock SET num_in_stock = %s WHERE stock_id = %s", (total,item))

    print("\nUPDATED INVENTORY\n")
    
    cursor.execute("SELECT * FROM stock")

    for x in cursor:
        print(x)

    #commits changes
    mydb.commit
        
def report():
    print("sale id, sale description, card_no, product_id")
    cursor.execute("SELECT * FROM sales")

    for x in cursor:
        print(x)

while (True):
    choice = input("1.Purchase Product \n2.Buy Inventory \n3.Sales Report\n")

        
    if choice == "1":
        purchase()
        
    if choice == "2":
        buy()
        
    if choice == "3":
        report()
                
    calculate_again = input("Would you like to use the system again? (y/n) ")
    if (calculate_again != "y"):
        #turns off cursor
        cursor.close()
        break  
    else:
        print("\n")

