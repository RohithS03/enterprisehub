import React from 'react';
import { Sun, Moon, Database, ShieldCheck } from 'lucide-react';

export default function Navbar({ darkMode, setDarkMode, metadata }) {
  return (
    <header className="bg-slate-900/60 backdrop-blur-md border-b border-slate-800 px-8 py-4 flex items-center justify-between sticky top-0 z-10">
      <div className="flex items-center gap-3">
        <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full text-xs font-semibold bg-emerald-500/10 text-emerald-400 border border-emerald-500/20">
          <ShieldCheck className="w-3.5 h-3.5" />
          <span>DBMS Engine Online</span>
        </span>
        <span className="text-xs text-slate-400 border-l border-slate-800 pl-3">
          Tables: <strong className="text-slate-200">{metadata?.total_tables || 18}</strong> | Records: <strong className="text-slate-200">{metadata?.total_records || 400}+</strong>
        </span>
      </div>

      <div className="flex items-center gap-4">
        <button
          onClick={() => setDarkMode(!darkMode)}
          className="p-2 rounded-xl bg-slate-800 text-slate-400 hover:text-slate-200 border border-slate-700/60 transition-colors"
          title="Toggle Dark Mode"
        >
          {darkMode ? <Sun className="w-4 h-4 text-amber-400" /> : <Moon className="w-4 h-4 text-slate-300" />}
        </button>
      </div>
    </header>
  );
}
