import unittest
import sys
import os

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app import app
from services.db_service import get_database_metadata, execute_query, get_table_details
from services.query_service import QUERY_CATALOG

class EnterpriseHubDatabaseTests(unittest.TestCase):

    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_health_endpoint(self):
        rv = self.app.get('/api/health')
        self.assertEqual(rv.status_code, 200)
        data = rv.get_json()
        self.assertEqual(data['status'], 'healthy')

    def test_database_metadata(self):
        meta = get_database_metadata()
        self.assertTrue(meta['total_tables'] >= 18)
        self.assertTrue(meta['total_records'] >= 400)

    def test_table_details(self):
        emp_details = get_table_details('employees')
        self.assertEqual(emp_details['table_name'], 'employees')
        self.assertTrue(len(emp_details['columns']) >= 9)
        self.assertTrue(emp_details['total_rows'] >= 40)

    def test_all_100_queries_execution(self):
        print(f"\n[Test Runner] Executing {len(QUERY_CATALOG)} SQL Queries against EnterpriseHub Database...")
        success_count = 0
        for q in QUERY_CATALOG:
            sql = q['sql']
            try:
                res = execute_query(sql)
                self.assertIsNotNone(res)
                success_count += 1
            except Exception as e:
                self.fail(f"Query ID #{q['id']} '{q['name']}' failed with error: {e}")
        print(f"[Test Runner] {success_count}/{len(QUERY_CATALOG)} SQL Queries Executed Successfully!")

if __name__ == '__main__':
    unittest.main()
