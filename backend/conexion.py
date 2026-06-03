import pymysql

def obtener_conexion():
    # Configuración por defecto para XAMPP / phpMyAdmin
    return pymysql.connect(
        host='localhost',
        user='root',       # Usuario predeterminado de XAMPP
        password='',       # Contraseña en blanco por defecto en XAMPP
        db='sistema_sri',  # El nombre de la base de datos que creaste
        cursorclass=pymysql.cursors.DictCursor
    )