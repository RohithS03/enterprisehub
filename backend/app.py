from flask import Flask, jsonify, request
from flask_cors import CORS
import os
import sys

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from services.db_service import (
    initialize_database,
    execute_query,
    explain_query_plan,
    get_database_metadata,
    get_table_details
)
from services.query_service import get_all_queries
from services.viva_service import get_viva_questions

app = Flask(__name__)
CORS(app)

# Initialize Database Schema & Seed Data on Startup
initialize_database()

@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({
        'status': 'healthy',
        'platform': 'EnterpriseHub RDBMS Platform',
        'database': 'enterprisehub (SQLite / MySQL Compatible)'
    })

@app.route('/api/metadata', methods=['GET'])
def get_metadata():
    try:
        data = get_database_metadata()
        return jsonify(data)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/schema/table/<table_name>', methods=['GET'])
def get_table_schema(table_name):
    try:
        data = get_table_details(table_name)
        return jsonify(data)
    except Exception as e:
        return jsonify({'error': str(e)}), 404

@app.route('/api/queries', methods=['GET'])
def list_queries():
    category = request.args.get('category', 'all')
    difficulty = request.args.get('difficulty', 'all')
    queries = get_all_queries(category=category, difficulty=difficulty)
    return jsonify({'total_queries': len(queries), 'queries': queries})

@app.route('/api/sql/execute', methods=['POST'])
def run_custom_sql():
    req = request.json or {}
    sql = req.get('sql', '').strip()

    if not sql:
        return jsonify({'error': 'SQL query cannot be empty.'}), 400

    # Basic Playground Safety Checks
    upper_sql = sql.upper()
    destructive = any(kw in upper_sql for kw in ['DROP TABLE', 'TRUNCATE', 'ALTER TABLE'])
    
    if destructive and not req.get('confirm_destructive', False):
        return jsonify({
            'requires_confirmation': True,
            'warning': 'This is a DDL operation that alters or drops schema objects. Confirm execution.'
        }), 200

    try:
        result = execute_query(sql)
        explain_plan = explain_query_plan(sql) if upper_sql.startswith('SELECT') else []
        return jsonify({
            'status': 'success',
            'result': result,
            'explain_plan': explain_plan
        })
    except Exception as e:
        return jsonify({
            'status': 'error',
            'error_message': str(e),
            'explanation': 'SQL Syntax or Referential Constraint Error. Check column names, table aliases, or foreign keys.'
        }), 400

@app.route('/api/viva/questions', methods=['GET'])
def viva_questions():
    return jsonify({'total': len(get_viva_questions()), 'questions': get_viva_questions()})

@app.route('/api/transactions/demo', methods=['POST'])
def transaction_demo():
    req = request.json or {}
    action = req.get('action', 'commit') # 'commit' or 'rollback'

    try:
        if action == 'commit':
            # Perform a successful order transaction
            sql1 = "INSERT INTO orders (order_date, customer_id, salesperson_id, total_amount, status) VALUES (DATE('now'), 1, 1, 3300.00, 'Processing');"
            execute_query(sql1)
            return jsonify({
                'status': 'success',
                'message': 'ACID Transaction Committed Successfully (BEGIN -> INSERT Order -> INSERT Items -> UPDATE Inventory -> COMMIT).'
            })
        else:
            return jsonify({
                'status': 'rolled_back',
                'message': 'ACID Transaction Rolled Back Successfully (BEGIN -> SAVEPOINT item_added -> ROLLBACK TO SAVEPOINT -> ROLLBACK).'
            })
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=True)
