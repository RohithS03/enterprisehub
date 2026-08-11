import React, { useState } from 'react';
import { Network, Key, ArrowRight, Table, Shield } from 'lucide-react';

export default function SchemaExplorer() {
  const [selectedEntity, setSelectedEntity] = useState('employees');

  const schemaMap = {
    employees: {
      pk: 'employee_id',
      fks: ['department_id -> departments(department_id)', 'manager_id -> employees(employee_id)'],
      relations: ['Assigned to employee_projects', 'Manages departments', 'Receives salary audits'],
      columns: ['employee_id (PK)', 'first_name', 'last_name', 'email (UNIQUE)', 'phone', 'gender', 'salary', 'hire_date', 'department_id (FK)', 'manager_id (FK)']
    },
    departments: {
      pk: 'department_id',
      fks: ['location_id -> locations(location_id)', 'manager_id -> employees(employee_id)'],
      relations: ['Contains employees', 'Hosts projects'],
      columns: ['department_id (PK)', 'department_name (UNIQUE)', 'manager_id (FK)', 'location_id (FK)']
    },
    orders: {
      pk: 'order_id',
      fks: ['customer_id -> customers(customer_id)', 'salesperson_id -> salespersons(salesperson_id)'],
      relations: ['Contains order_items', 'Belongs to customers'],
      columns: ['order_id (PK)', 'order_date', 'customer_id (FK)', 'salesperson_id (FK)', 'total_amount', 'status']
    },
    products: {
      pk: 'product_id',
      fks: ['category_id -> categories(category_id)', 'supplier_id -> suppliers(supplier_id)'],
      relations: ['Included in order_items', 'Stocked in inventory'],
      columns: ['product_id (PK)', 'product_name', 'category_id (FK)', 'supplier_id (FK)', 'price', 'stock_quantity']
    },
    books: {
      pk: 'book_id',
      fks: ['publisher_id -> publishers(publisher_id)'],
      relations: ['Mapped in book_authors', 'Distributed in book_copies', 'Borrowed in book_lending'],
      columns: ['book_id (PK)', 'title', 'publication_year', 'publisher_id (FK)']
    }
  };

  const active = schemaMap[selectedEntity] || schemaMap.employees;

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      <div>
        <h1 className="text-2xl font-extrabold text-slate-100 flex items-center gap-2">
          <Network className="w-6 h-6 text-emerald-400" />
          Interactive Database Schema & ER Visualizer
        </h1>
        <p className="text-slate-400 text-sm mt-1">
          Explore table relationships, primary keys, foreign keys, and relational mapping cardinality.
        </p>
      </div>

      {/* Entity Selector Buttons */}
      <div className="flex flex-wrap gap-2">
        {Object.keys(schemaMap).map((key) => (
          <button
            key={key}
            onClick={() => setSelectedEntity(key)}
            className={`px-4 py-2 rounded-xl text-xs font-semibold uppercase tracking-wider transition-all ${
              selectedEntity === key
                ? 'bg-emerald-500 text-white shadow-md shadow-emerald-500/20'
                : 'bg-slate-900 text-slate-400 hover:text-slate-200 border border-slate-800'
            }`}
          >
            {key}
          </button>
        ))}
      </div>

      {/* Visualizer Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="p-6 rounded-2xl glass-card space-y-4">
          <h3 className="font-bold text-slate-100 text-base flex items-center gap-2">
            <Table className="w-5 h-5 text-emerald-400" />
            Table: <span className="font-mono text-emerald-400 uppercase">{selectedEntity}</span>
          </h3>

          <div className="space-y-2">
            <div className="text-xs font-semibold text-slate-400">Columns & Constraints:</div>
            <div className="space-y-1">
              {active.columns.map((c) => (
                <div key={c} className="p-2 rounded-lg bg-slate-950/60 border border-slate-800 text-xs font-mono text-slate-300 flex justify-between">
                  <span>{c}</span>
                  {c.includes('(PK)') && <span className="text-amber-400 font-bold">PRIMARY KEY</span>}
                  {c.includes('(FK)') && <span className="text-sky-400 font-bold">FOREIGN KEY</span>}
                </div>
              ))}
            </div>
          </div>
        </div>

        <div className="p-6 rounded-2xl glass-card space-y-4">
          <h3 className="font-bold text-slate-100 text-base flex items-center gap-2">
            <Key className="w-5 h-5 text-amber-400" />
            Relational Foreign Keys & Cardinality
          </h3>

          <div className="space-y-4">
            <div>
              <div className="text-xs font-semibold text-slate-400 mb-1">Foreign Key Constraints:</div>
              <ul className="space-y-1.5 text-xs font-mono text-slate-300">
                {active.fks.map((fk) => (
                  <li key={fk} className="p-2.5 rounded-lg bg-slate-950/60 border border-slate-800 text-sky-300">
                    {fk}
                  </li>
                ))}
              </ul>
            </div>

            <div>
              <div className="text-xs font-semibold text-slate-400 mb-1">Relational Mapping:</div>
              <ul className="space-y-1.5 text-xs text-slate-300">
                {active.relations.map((rel) => (
                  <li key={rel} className="p-2.5 rounded-lg bg-slate-950/60 border border-slate-800 flex items-center gap-2">
                    <ArrowRight className="w-3.5 h-3.5 text-emerald-400 shrink-0" />
                    <span>{rel}</span>
                  </li>
                ))}
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
