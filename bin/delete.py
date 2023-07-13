import psycopg2
import os


def execute_sql_file(conn, file_path):
    with open(file_path, 'r') as sql_file:
        commands = sql_file.read()

    cur = conn.cursor()
    cur.execute(commands)
    conn.commit()
    cur.close()


def main():
    # Database connection parameters
    db_host = 'cruddur-instance.cg9sicaobjz0.us-east-1.rds.amazonaws.com'
    db_port = 5432
    db_name = 'cruddur'
    db_user = 'root'
    db_password = 'dbPassword'

    # Path to the SQL file
    sql_file_path = os.path.join(os.path.dirname(__file__), './db/delete_expired_crud.sql')

    try:
        # Connect to the database
        conn = psycopg2.connect(
            host=db_host,
            port=db_port,
            dbname=db_name,
            user=db_user,
            password=db_password
        )
        
        # Execute the SQL file
        execute_sql_file(conn, sql_file_path)

        # Close the database connection
        conn.close()

        print("SQL file executed successfully.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")


if __name__ == '__main__':
    main()