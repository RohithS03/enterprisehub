import React from 'react';
import { Database, Table, Eye, Cpu, Zap, Key, Layers, FileCode } from 'lucide-react';

export default function Dashboard({ metadata, setActiveTab }) {
  const statCards = [
    { title: 'Relational Tables', count: metadata?.total_tables || 18, desc: 'Across 5 Enterprise Modules', icon: Table, color: 'text-emerald-400' },
    { title: 'Total Records', count: `${metadata?.total_records || 400}+`, desc: 'Seeded Relational Tuples', icon: Database, color: 'text-teal-400' },
    { title: 'Database Views', count: metadata?.total_views || 5, desc: 'Virtual Query Abstractions', icon: Eye, color: 'text-sky-400' },
    { title: 'Procedures & Functions', count: (metadata?.total_procedures || 2) + (metadata?.total_functions || 2), desc: 'Stored Logic Routines', icon: Cpu, color: 'text-indigo-400' },
    { title: 'Triggers & Audits', count: metadata?.total_triggers || 2, desc: 'Automated Event Hooks', icon: Zap, color: 'text-amber-400' },
    { title: 'Executable SQL Queries', count: '100+', desc: 'Catalog (Level 1 to Level 5)', icon: FileCode, color: 'text-purple-400' },
  ];

  const modules = [
    { title: 'Organization Module', tables: ['departments', 'employees', 'locations'], desc: 'Department hierarchies, manager self-joins, salary constraints.' },
    { title: 'Project Management', tables: ['projects', 'employee_projects'], desc: 'Many-to-many junction table, composite PKs, hours logging.' },
    { title: 'Sales & Customer CRM', tables: ['customers', 'salespersons', 'orders', 'order_items'], desc: 'Customer grades, sales commissions, order total calculations.' },
    { title: 'Inventory & Supply Chain', tables: ['categories', 'products', 'suppliers', 'warehouses', 'inventory'], desc: 'Stock allocation, warehouse inventory composite keys.' },
    { title: 'Resource & Library', tables: ['publishers', 'authors', 'books', 'book_authors', 'library_branches', 'book_copies', 'members', 'book_lending'], desc: 'Library branch book copies, multi-author books, overdue loan tracking.' },
  ];

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      {/* Hero Banner */}
      <div className="p-8 rounded-3xl bg-gradient-to-r from-emerald-950/40 via-teal-900/30 to-slate-900/80 border border-emerald-500/20 glass-card">
        <div className="max-w-3xl">
          <span className="px-3 py-1 rounded-full text-xs font-bold uppercase tracking-wider bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 inline-block mb-3">
            RDBMS & SQL Operations Platform
          </span>
          <h1 className="text-3xl sm:text-4xl font-extrabold text-slate-100 tracking-tight leading-tight">
            EnterpriseHub Database System
          </h1>
          <p className="text-slate-300 text-sm mt-3 leading-relaxed">
            An integrated 18-table enterprise database demonstrating RDBMS fundamentals, DDL, DML, DCL, TCL, ACID transactions, 100+ SQL queries, stored procedures, triggers, B-Tree indexes, and 1NF-BCNF normalization.
          </p>
          <div className="flex items-center gap-4 mt-6">
            <button
              onClick={() => setActiveTab('queries')}
              className="px-5 py-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-teal-600 text-white font-semibold text-xs shadow-lg shadow-emerald-500/20 hover:opacity-95 transition-all"
            >
              Explore 100+ SQL Queries
            </button>
            <button
              onClick={() => setActiveTab('playground')}
              className="px-5 py-2.5 rounded-xl bg-slate-800 hover:bg-slate-700 text-slate-200 font-semibold text-xs border border-slate-700 transition-colors"
            >
              Open SQL Sandbox
            </button>
          </div>
        </div>
      </div>

      {/* Metadata Counter Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {statCards.map((card, idx) => {
          const Icon = card.icon;
          return (
            <div key={idx} className="p-5 rounded-2xl glass-card border border-slate-800 flex items-center justify-between">
              <div>
                <div className="text-xs font-semibold text-slate-400 uppercase tracking-wider">{card.title}</div>
                <div className="text-2xl font-black text-slate-100 mt-1">{card.count}</div>
                <div className="text-xs text-slate-500 mt-0.5">{card.desc}</div>
              </div>
              <div className={`p-3 rounded-xl bg-slate-950/60 border border-slate-800 ${card.color}`}>
                <Icon className="w-5 h-5" />
              </div>
            </div>
          );
        })}
      </div>

      {/* Modules Overview */}
      <div className="p-6 rounded-2xl glass-card">
        <h3 className="font-bold text-slate-100 text-base mb-4 flex items-center gap-2">
          <Layers className="w-5 h-5 text-emerald-400" />
          Enterprise Relational Modules
        </h3>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {modules.map((mod, idx) => (
            <div key={idx} className="p-4 rounded-xl bg-slate-950/60 border border-slate-800 space-y-2">
              <h4 className="font-bold text-slate-200 text-sm">{mod.title}</h4>
              <p className="text-xs text-slate-400 leading-relaxed">{mod.desc}</p>
              <div className="flex flex-wrap gap-1.5 pt-2">
                {mod.tables.map((t) => (
                  <span key={t} className="px-2 py-0.5 rounded-md bg-slate-900 border border-slate-800 text-[10px] font-mono text-emerald-400">
                    {t}
                  </span>
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
