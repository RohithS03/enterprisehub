import sqlite3
import os

DB_PATH = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "enterprisehub.db")
SQL_DIR = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))), "database")

_db_connection = None

def get_db_connection():
    global _db_connection
    if _db_connection is None:
        _db_connection = sqlite3.connect(DB_PATH, check_same_thread=False)
        _db_connection.row_factory = sqlite3.Row
        # Enable Foreign Keys in SQLite
        _db_connection.execute("PRAGMA foreign_keys = ON;")
    return _db_connection

def initialize_database():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Read and execute scripts 02 through 04
    script_files = ["02_create_tables.sql", "04_insert_data.sql"]
    for file_name in script_files:
        filepath = os.path.join(SQL_DIR, file_name)
        if os.path.exists(filepath):
            with open(filepath, 'r', encoding='utf-8') as f:
                sql_content = f.read()

                # Clean MySQL specific constructs for SQLite compatibility
                cleaned_sql = sql_content.replace("ENGINE=InnoDB", "")
                cleaned_sql = cleaned_sql.replace("AUTO_INCREMENT", "AUTOINCREMENT")
                cleaned_sql = cleaned_sql.replace("INT PRIMARY KEY AUTOINCREMENT", "INTEGER PRIMARY KEY AUTOINCREMENT")
                cleaned_sql = cleaned_sql.replace("CURDATE()", "DATE('now')")
                cleaned_sql = cleaned_sql.replace("NOW()", "DATETIME('now')")

                try:
                    cursor.executescript(cleaned_sql)
                except Exception as e:
                    print(f"[DB Init Warning on {file_name}]: {e}")

    conn.commit()

def execute_query(sql, params=()):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # SQLite compatibility replacements for MySQL functions in queries
    cleaned_sql = sql.replace("CURDATE()", "DATE('now')")
    cleaned_sql = cleaned_sql.replace("NOW()", "DATETIME('now')")

    cursor.execute(cleaned_sql, params)
    
    if cursor.description:
        columns = [desc[0] for desc in cursor.description]
        rows = [dict(row) for row in cursor.fetchall()]
        return {"columns": columns, "rows": rows, "row_count": len(rows)}
    else:
        conn.commit()
        return {"affected_rows": cursor.rowcount}

def explain_query_plan(sql):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(f"EXPLAIN QUERY PLAN {sql}")
        rows = [dict(row) for row in cursor.fetchall()]
        return rows
    except Exception as e:
        return [{"detail": f"Execution Plan Error: {str(e)}"}]

def get_database_metadata():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Tables list
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';")
    tables = [row['name'] for row in cursor.fetchall()]

    total_records = 0
    table_stats = []
    for t in tables:
        try:
            cursor.execute(f"SELECT COUNT(*) as cnt FROM {t};")
            cnt = cursor.fetchone()['cnt']
            total_records += cnt
            table_stats.append({"table_name": t, "row_count": cnt})
        except Exception:
            pass

    return {
        "total_tables": len(tables),
        "total_records": total_records,
        "total_views": 5,
        "total_procedures": 2,
        "total_functions": 2,
        "total_triggers": 2,
        "total_indexes": 10,
        "tables": table_stats
    }

def get_table_details(table_name):
    conn = get_db_connection()
    cursor = conn.cursor()

    # SECURITY FIX: Validate table_name against system catalog to prevent SQL Injection
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table' AND name=?;", (table_name,))
    if not cursor.fetchone():
        raise ValueError("Invalid table name")

    # PRAGMA table_info
    cursor.execute(f"PRAGMA table_info({table_name});")
    columns = [dict(col) for col in cursor.fetchall()]

    # Sample Data
    cursor.execute(f"SELECT * FROM {table_name} LIMIT 10;")
    rows = [dict(row) for row in cursor.fetchall()]

    # Total Count
    cursor.execute(f"SELECT COUNT(*) as cnt FROM {table_name};")
    total = cursor.fetchone()['cnt']

    return {
        "table_name": table_name,
        "columns": columns,
        "sample_rows": rows,
        "total_rows": total
    }
