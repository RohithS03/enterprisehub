import React from 'react';
import { LayoutDashboard, Network, Database, Search, Terminal, Eye, Repeat, Layers, HelpCircle, BookOpen } from 'lucide-react';

export default function Sidebar({ activeTab, setActiveTab }) {
  const navItems = [
    { id: 'dashboard', label: 'Dashboard', icon: LayoutDashboard },
    { id: 'schema', label: 'Database Schema', icon: Network },
    { id: 'tables', label: 'Table Explorer', icon: Database },
    { id: 'queries', label: 'SQL Query Catalog (100+)', icon: Search },
    { id: 'playground', label: 'SQL Playground', icon: Terminal },
    { id: 'objects', label: 'Views & Triggers', icon: Eye },
    { id: 'transactions', label: 'ACID Transactions', icon: Repeat },
    { id: 'normalization', label: 'Normalization (1NF-BCNF)', icon: Layers },
    { id: 'viva', label: 'Viva Mode QA', icon: HelpCircle },
  ];

  return (
    <aside className="w-64 bg-slate-900/90 border-r border-slate-800 flex flex-col justify-between h-screen sticky top-0 z-20">
      <div>
        {/* Brand */}
        <div className="p-6 border-b border-slate-800 flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-gradient-to-tr from-emerald-500 to-teal-600 flex items-center justify-center text-white shadow-lg shadow-emerald-500/20 font-mono font-bold text-lg">
            EH
          </div>
          <div>
            <h1 className="font-bold text-slate-100 tracking-tight text-base leading-none">EnterpriseHub</h1>
            <span className="text-xs text-emerald-400 font-medium">Relational DBMS Studio</span>
          </div>
        </div>

        {/* Nav Items */}
        <nav className="p-4 space-y-1.5 overflow-y-auto max-h-[calc(100vh-140px)]">
          {navItems.map((item) => {
            const Icon = item.icon;
            const isActive = activeTab === item.id;
            return (
              <button
                key={item.id}
                onClick={() => setActiveTab(item.id)}
                className={`w-full flex items-center gap-3 px-4 py-2.5 rounded-xl text-xs font-semibold transition-all duration-200 ${
                  isActive
                    ? 'bg-gradient-to-r from-emerald-500 to-teal-600 text-white shadow-md shadow-emerald-500/20'
                    : 'text-slate-400 hover:text-slate-200 hover:bg-slate-800/60'
                }`}
              >
                <Icon className={`w-4 h-4 ${isActive ? 'text-white' : 'text-slate-400'}`} />
                <span>{item.label}</span>
              </button>
            );
          })}
        </nav>
      </div>

      <div className="p-4 m-4 bg-slate-950/60 border border-slate-800/80 rounded-xl text-center">
        <div className="text-xs font-bold text-slate-300">MySQL 8.0 & SQLite 3</div>
        <div className="text-[11px] text-slate-500 mt-0.5">18 Relational Tables</div>
      </div>
    </aside>
  );
}
