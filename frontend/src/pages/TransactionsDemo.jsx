import React, { useState } from 'react';
import { Repeat, CheckCircle2, RotateCcw, ShieldCheck, Play } from 'lucide-react';
import { runTransactionDemo } from '../services/api';

export default function TransactionsDemo() {
  const [log, setLog] = useState(null);
  const [loading, setLoading] = useState(false);

  async function handleDemo(action) {
    setLoading(true);
    try {
      const res = await runTransactionDemo(action);
      setLog(res);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      <div>
        <h1 className="text-2xl font-extrabold text-slate-100 flex items-center gap-2">
          <Repeat className="w-6 h-6 text-emerald-400" />
          ACID Transactions & Control Flow (TCL)
        </h1>
        <p className="text-slate-400 text-sm mt-1">
          Demonstrates transaction Atomicity, Consistency, Isolation, and Durability using BEGIN, SAVEPOINT, COMMIT, and ROLLBACK.
        </p>
      </div>

      {/* ACID Principles Grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="p-4 rounded-2xl glass-card border border-emerald-500/20 bg-emerald-500/5">
          <h4 className="font-bold text-emerald-400 text-sm mb-1">Atomicity</h4>
          <p className="text-xs text-slate-300">All-or-nothing execution. If any step fails, the entire transaction rolls back to preserve consistency.</p>
        </div>
        <div className="p-4 rounded-2xl glass-card border border-sky-500/20 bg-sky-500/5">
          <h4 className="font-bold text-sky-400 text-sm mb-1">Consistency</h4>
          <p className="text-xs text-slate-300">Database transitions strictly from one valid state to another, satisfying all foreign keys and constraints.</p>
        </div>
        <div className="p-4 rounded-2xl glass-card border border-indigo-500/20 bg-indigo-500/5">
          <h4 className="font-bold text-indigo-400 text-sm mb-1">Isolation</h4>
          <p className="text-xs text-slate-300">Concurrent transactions execute independently without uncommitted dirty read side effects.</p>
        </div>
        <div className="p-4 rounded-2xl glass-card border border-amber-500/20 bg-amber-500/5">
          <h4 className="font-bold text-amber-400 text-sm mb-1">Durability</h4>
          <p className="text-xs text-slate-300">Once committed, transaction updates persist permanently in non-volatile storage even after power loss.</p>
        </div>
      </div>

      {/* Interactive Controls */}
      <div className="p-6 rounded-2xl glass-card space-y-4">
        <h3 className="font-bold text-slate-100 text-base">Interactive Order Placement Transaction Simulator</h3>
        <p className="text-xs text-slate-400">
          Simulates creating an Order, inserting Order Items, deducting inventory stock, and executing COMMIT or ROLLBACK TO SAVEPOINT.
        </p>

        <div className="flex gap-4">
          <button
            onClick={() => handleDemo('commit')}
            disabled={loading}
            className="px-5 py-2.5 rounded-xl bg-gradient-to-r from-emerald-500 to-teal-600 text-white font-bold text-xs shadow-lg shadow-emerald-500/20 hover:opacity-95 disabled:opacity-50 transition-all flex items-center gap-2"
          >
            <CheckCircle2 className="w-4 h-4" />
            <span>Execute & COMMIT Transaction</span>
          </button>
          <button
            onClick={() => handleDemo('rollback')}
            disabled={loading}
            className="px-5 py-2.5 rounded-xl bg-slate-800 hover:bg-slate-700 text-rose-400 font-bold text-xs border border-slate-700 transition-colors flex items-center gap-2"
          >
            <RotateCcw className="w-4 h-4" />
            <span>Simulate Failure & ROLLBACK</span>
          </button>
        </div>

        {log && (
          <div className={`p-4 rounded-xl border text-xs font-mono mt-4 ${log.status === 'success' ? 'bg-emerald-500/10 border-emerald-500/20 text-emerald-300' : 'bg-rose-500/10 border-rose-500/20 text-rose-300'}`}>
            {log.message}
          </div>
        )}
      </div>
    </div>
  );
}
