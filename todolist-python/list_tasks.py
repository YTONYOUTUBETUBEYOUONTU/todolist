import psycopg2
from psycopg2 import sql, OperationalError

DB_NAME = "todolist" 
DB_USER = "postgres"
DB_PASSWORD = "root"  
DB_HOST = "localhost"
DB_PORT = "5432" 

def list_tasks():
    try:
        conn = psycopg2.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT
        )
        cur = conn.cursor()

        query = sql.SQL("SELECT * FROM public.tasks;")

        cur.execute(query)
        tasks = cur.fetchall()

        if tasks:
            print("\nTareas en la base de datos:")
            for task in tasks:
                print(task)
        else:
            print("\nNo hay tareas registradas.")

        cur.close()
        conn.close()

    except OperationalError as e:
        print(f"Error al conectar con la base de datos: {e}")
    except Exception as e:
        print(f"Error ejecutando la consulta: {e}")

if __name__ == "__main__":
    list_tasks()
