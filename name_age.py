# sample program that will test the mysql connection to be working properly. 
# it will ask the user for their name and age and then insert that data into the database.
# use this script to test if the connection is working properly.

import mysql.connector

# Connect to MySQL database
mydb = mysql.connector.connect(
    host="127.0.0.1",
    user="merasql",
    password="merasql",
    database="persons"
)

# Create a cursor object
mycursor = mydb.cursor()

# Get user input
name = input("Enter your name: ")
age = input("Enter your age: ")

# Insert user input into "userinputs" table
sql = "INSERT INTO persons (name, age) VALUES (%s, %s)"
val = (name, age)
mycursor.execute(sql, val)

# Commit changes to database
mydb.commit()

# Print confirmation message
print(mycursor.rowcount, "record inserted.")