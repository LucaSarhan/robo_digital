#Importing the libraries

import sqlite3

from flask import Flask, render_template, request, redirect, url_for, jsonify

#Initializing a flask instance

app = Flask(__name__)

#Route to add positions

@app.route("/addPosition", methods=['POST'])

#Function that puts the values ​​provided in the form in the table

def registerPosition():

    X = request.form["X"]

    Y = request.form["Y"]

    Z = request.form["Z"]
    
    sq = sqlite3.connect("Coordinates.db")

    cursor = sq.cursor()

    cursor.execute('INSERT INTO Robo (X,Y,Z) VALUES (?,?,?)', (X,Y,Z))

    sq.commit()

    sq.close()

    return redirect("/")

#Route to show HTML page

@app.route("/", methods=['GET'])

#Function that takes values ​​from the sq file and returns them to an html page

def PageRobot():

    positions = Table69()

    #Returns an HTML page with position variables

    return render_template(

        "PageRobot.html",

        positions=positions,

        )

#Route to connect to Godot

@app.route("/godot", methods=['GET'])

def Godot():

    oof = Table69()

    return jsonify(oof)
    

#Gets values in table and returns position

def Table69():

    sq = sqlite3.connect("Coordinates.db")

    cursor = sq.cursor()

    cursor.execute('SELECT * FROM Robo')

    rows = cursor.fetchall()

    sq.close()

    #Store coordinate values

    positions = []

    for i in rows:

        coordinate = {}

        coordinate['X'] = i[0]

        coordinate['Y'] = i[1]

        coordinate['Z'] = i[2]

        positions.append(coordinate)

    print(positions)
    
    return positions

#Runs the api

if __name__ == "__main__":

    app.run(debug=True)