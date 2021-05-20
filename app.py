# Imports of libraries / Importanción de librerías
from types import MethodDescriptorType, MethodType
from flask import Flask, render_template, redirect, request
from flaskext.mysql import MySQL
from datetime import datetime

# Initialization of the app / Inicialización de la aplicación
app = Flask(__name__)

# MYSQL connection settings / MYSQL configuración de conexión
mysql = MySQL()
app.config["MYSQL_DATABASE_HOST"] = "localhost"
app.config["MYSQL_DATABASE_USER"] = "root"
app.config["MYSQL_DATABASE_PASSWORD"] = ""
app.config["MYSQL_DATABASE_DB"] = "video_game_collection"
mysql.init_app(app)

# Route & Method for the login / Ruta y método para el login
@app.route("/")
def get_index():
    return render_template("login.html")

@app.route("/login", methods=["POST"])
def do_login():
    __user = request.form["input_user"]
    __password = request.form["input_password"]

    data = (__user, __password)

    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(
        "SELECT * FROM `user` WHERE user_name = %s AND user_password = %s", data)
    user = cursor.fetchall()
    conn.commit()

    if user[0][3] == 1:
        return redirect("/admin")
    else:
        return redirect("/no_admin")

# Route & Method for User-Admin / Ruta y método para usuario admin
@app.route("/admin")
def get_admin_page():
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM `videogame`")
    videogames = cursor.fetchall()
    conn.commit()
    return render_template("user/admin.html", videogames_data=videogames)

# Route & Method for No-Admin / Ruta y método para usuario no-admin
@app.route("/no_admin")
def get_no_admin_page():

    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM `videogame`")
    videogames = cursor.fetchall()
    conn.commit()

    return render_template("user/no_admin.html", videogames_data=videogames)

# Route & Method for adding videogame / Ruta y método para agregar un videojuego
@app.route("/create_videogame")
def get_create_videogame_page():
    return render_template("videogame/create.html")


@app.route("/store_game", methods=["POST"])
def create_videogame():
    __title = request.form["input_title"]
    __console = request.form["input_console"]
    __cover = request.files["input_cover"]

    if __cover.filename != "":
        now = datetime.now()
        time_stamp = now.strftime("%Y%H%M%S")
        __new_cover_name = __cover.filename + time_stamp
        __cover.save("uploads/"+__new_cover_name)

    game_data = (__title, __new_cover_name, __console)
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO `videogame` (`videogame_id`, `videogame_title`, `videogame_photo`, `videogame_console`) VALUES (NULL, %s, %s, %s)", game_data)
    conn.commit()

    return redirect("/admin")

# Route and method for update a game / Ruta y método para actulizaar videojuego
@app.route("/edit_game/<int:id>")
def get_edit_page(id):
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM `videogame` WHERE videogame_id = "+str(id))
    game = cursor.fetchall()
    conn.commit()
    return render_template("/videogame/edit.html", game_data=game)

@app.route("/edit_game", methods=["POST"])
def edit_game():

    __id = request.form["input_id"]
    __title = request.form["input_title"]
    __console = request.form["input_console"]
    __cover = request.files["input_cover"]

    if __cover.filename != "":
        now = datetime.now()
        time_stamp = now.strftime("%Y%H%M%S")
        __new_cover_name = __cover.filename + time_stamp
        __cover.save("uploads/"+__new_cover_name)

    game_data = (__title, __new_cover_name, __console, __id)
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute("UPDATE `videogame` SET `videogame_title` = %s, `videogame_photo` = %s, `videogame_console` = %s WHERE `videogame`.`videogame_id` = %s", game_data)
    conn.commit()

    return redirect("/admin")

# Route and method for delete a videogame / Ruta y método para eliminar un videojuego
@app.route("/delete_videogame/<int:id>")
def delete_game(id):
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(
        "DELETE FROM `videogame` WHERE `videogame`.`videogame_id` = "+str(id))
    conn.commit()

    return redirect("/admin")

#Start of the app / Inicio de la aplicación
if __name__ == "__main__":
    app.run(debug=True, port=5777)
