import React from 'react';
import { Eye, Cpu, Zap } from 'lucide-react';

export default function ObjectsView() {
  const views = [
    { name: 'employee_department_view', desc: 'Joins employees with department name and location city/country.', sql: 'CREATE VIEW employee_department_view AS SELECT e.employee_id, CONCAT(e.first_name, \' \', e.last_name) AS full_name, e.email, e.salary, d.department_name, l.city FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id LEFT JOIN locations l ON d.location_id = l.location_id;' },
    { name: 'customer_sales_view', desc: 'Summarizes customer spending totals and assigned sales reps.', sql: 'CREATE VIEW customer_sales_view AS SELECT c.customer_id, c.customer_name, s.name AS salesperson_name, COUNT(o.order_id) AS total_orders, SUM(o.total_amount) AS lifetime_spending FROM customers c LEFT JOIN salespersons s ON c.salesperson_id = s.salesperson_id LEFT JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id;' },
    { name: 'product_inventory_view', desc: 'Aggregates stock levels across all warehouses per catalog product.', sql: 'CREATE VIEW product_inventory_view AS SELECT p.product_id, p.product_name, cat.category_name, p.price, p.stock_quantity FROM products p LEFT JOIN categories cat ON p.category_id = cat.category_id;' },
    { name: 'available_books_view', desc: 'Exposes library books, branch locations, and available copies.', sql: 'CREATE VIEW available_books_view AS SELECT b.book_id, b.title, lb.branch_name, bc.number_of_copies FROM books b JOIN book_copies bc ON b.book_id = bc.book_id JOIN library_branches lb ON bc.branch_id = lb.branch_id;' },
    { name: 'project_employee_view', desc: 'Logs assigned employee count and total hours worked per project.', sql: 'CREATE VIEW project_employee_view AS SELECT p.project_id, p.project_name, COUNT(ep.employee_id) AS assigned_employees, SUM(ep.hours_worked) AS total_hours FROM projects p LEFT JOIN employee_projects ep ON p.project_id = ep.project_id GROUP BY p.project_id;' }
  ];

  const triggers = [
    { name: 'trg_employee_salary_audit', event: 'AFTER UPDATE ON employees', desc: 'Automatically records old and new salary changes into employee_salary_audit table.' },
    { name: 'trg_update_inventory_on_order', event: 'AFTER INSERT ON order_items', desc: 'Automatically reduces catalog stock_quantity when a new order item is created.' }
  ];

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      <div>
        <h1 className="text-2xl font-extrabold text-slate-100 flex items-center gap-2">
          <Eye className="w-6 h-6 text-emerald-400" />
          Views, Stored Routines & Event Triggers
        </h1>
        <p className="text-slate-400 text-sm mt-1">
          Explore virtual database abstractions, stored procedures, deterministic functions, and audit triggers.
        </p>
      </div>

      {/* Views Section */}
      <div className="space-y-4">
        <h3 className="font-bold text-slate-100 text-base flex items-center gap-2">
          <Eye className="w-5 h-5 text-sky-400" />
          Enterprise Views ({views.length})
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {views.map((v) => (
            <div key={v.name} className="p-5 rounded-2xl glass-card border border-slate-800 space-y-3">
              <h4 className="font-bold text-emerald-400 font-mono text-sm">{v.name}</h4>
              <p className="text-xs text-slate-400 leading-relaxed">{v.desc}</p>
              <pre className="p-3 rounded-xl bg-slate-950 border border-slate-800 font-mono text-[11px] text-slate-300 overflow-x-auto">
                {v.sql}
              </pre>
            </div>
          ))}
        </div>
      </div>

      {/* Triggers Section */}
      <div className="space-y-4">
        <h3 className="font-bold text-slate-100 text-base flex items-center gap-2">
          <Zap className="w-5 h-5 text-amber-400" />
          Database Event Triggers ({triggers.length})
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {triggers.map((t) => (
            <div key={t.name} className="p-5 rounded-2xl glass-card border border-amber-500/20 bg-amber-500/5 space-y-2">
              <span className="text-[10px] font-bold uppercase tracking-wider text-amber-400 font-mono">{t.event}</span>
              <h4 className="font-bold text-slate-100 font-mono text-sm">{t.name}</h4>
              <p className="text-xs text-slate-300 leading-relaxed">{t.desc}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
