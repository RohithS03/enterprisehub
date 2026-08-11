import React, { useState } from 'react';
import { Terminal, Play, Cpu, AlertTriangle, ShieldCheck } from 'lucide-react';
import { executeSql } from '../services/api';
import SqlTable from '../components/SqlTable';

export default function SqlPlayground({ initialSql }) {
  const [sql, setSql] = useState(initialSql || 'SELECT e.employee_id, e.first_name, e.salary, d.department_name\nFROM employees e\nJOIN departments d ON e.department_id = d.department_id\nWHERE e.salary > 80000\nORDER BY e.salary DESC;');
  const [result, setResult] = useState(null);
  const [explainPlan, setExplainPlan] = useState(null);
  const [loading, setLoading] = useState(false);
  const [errorMsg, setErrorMsg] = useState(null);
  const [warningMsg, setWarningMsg] = useState(null);
  const [execTime, setExecTime] = useState(null);

  async function handleExecute(confirmDestructive = false) {
    setLoading(true);
    setErrorMsg(null);
    setWarningMsg(null);
    setResult(null);
    setExplainPlan(null);
    const start = performance.now();
    try {
      const res = await executeSql(sql, confirmDestructive);
      if (res.requires_confirmation) {
        setWarningMsg(res.warning);
      } else if (res.status === 'error') {
        setErrorMsg(res.error_message);
      } else {
        setResult(res.result);
        setExplainPlan(res.explain_plan || []);
      }
    } catch (err) {
      setErrorMsg(err.message);
    } finally {
      const duration = (performance.now() - start).toFixed(1);
      setExecTime(duration);
      setLoading(false);
    }
  }

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      <div>
        <h1 className="text-2xl font-extrabold text-slate-100 flex items-center gap-2">
          <Terminal className="w-6 h-6 text-emerald-400" />
          SQL Sandbox & Execution Plan Visualizer
        </h1>
        <p className="text-slate-400 text-sm mt-1">
          Write and execute arbitrary SQL statements against the EnterpriseHub relational database. Includes live EXPLAIN query planner output.
        </p>
      </div>

      {/* SQL Editor Card */}
      <div className="p-6 rounded-2xl glass-card space-y-4">
        <div className="flex items-center justify-between">
          <span className="text-xs font-semibold text-slate-400 uppercase tracking-wider">SQL Sandbox Editor</span>
          <div className="flex items-center gap-2">
            <button
              onClick={() => handleExecute(false)}
              disabled={loading}
              className="px-5 py-2 rounded-xl bg-gradient-to-r from-emerald-500 to-teal-600 text-white font-bold text-xs shadow-lg shadow-emerald-500/20 hover:opacity-95 disabled:opacity-50 transition-all flex items-center gap-2"
            >
              <Play className="w-3.5 h-3.5" />
              <span>{loading ? 'Executing...' : 'Execute SQL'}</span>
            </button>
          </div>
        </div>

        <textarea
          rows={6}
          value={sql}
          onChange={(e) => setSql(e.target.value)}
          className="w-full bg-slate-950/90 border border-slate-800 rounded-xl p-4 font-mono text-xs text-emerald-300 focus:outline-none focus:border-emerald-500 leading-relaxed shadow-inner"
          placeholder="Enter SQL statement..."
        />
      </div>

      {/* Warning confirmation */}
      {warningMsg && (
        <div className="p-5 rounded-2xl glass-card border border-amber-500/30 bg-amber-500/10 space-y-3">
          <div className="flex items-center gap-2 text-amber-400 font-bold text-sm">
            <AlertTriangle className="w-4 h-4" />
            <span>{warningMsg}</span>
          </div>
          <button
            onClick={() => handleExecute(true)}
            className="px-4 py-2 rounded-xl bg-amber-500 text-slate-950 font-bold text-xs hover:bg-amber-400"
          >
            Confirm & Force Execute DDL
          </button>
        </div>
      )}

      {/* Error Output */}
      {errorMsg && (
        <div className="p-5 rounded-2xl glass-card border border-rose-500/30 bg-rose-500/10 text-xs text-rose-300 font-mono">
          <div className="font-bold text-rose-400 mb-1">SQL Syntax or Execution Error:</div>
          <div>{errorMsg}</div>
        </div>
      )}

      {/* Execution Results */}
      {result && (
        <div className="p-6 rounded-2xl glass-card space-y-6">
          <h3 className="font-bold text-slate-100 text-base">Execution Result Output</h3>
          {result.columns ? (
            <SqlTable columns={result.columns} rows={result.rows} executionTime={execTime} />
          ) : (
            <div className="p-4 bg-emerald-500/10 border border-emerald-500/20 rounded-xl text-xs text-emerald-400 font-mono">
              Statement executed successfully. Affected Rows: {result.affected_rows}
            </div>
          )}

          {/* EXPLAIN Execution Plan */}
          {explainPlan && explainPlan.length > 0 && (
            <div className="pt-4 border-t border-slate-800 space-y-2">
              <div className="text-xs font-semibold text-slate-400 uppercase tracking-wider flex items-center gap-2">
                <Cpu className="w-4 h-4 text-sky-400" />
                <span>EXPLAIN QUERY PLAN (Query Optimizer Steps)</span>
              </div>
              <div className="space-y-1">
                {explainPlan.map((step, idx) => (
                  <div key={idx} className="p-2 rounded-lg bg-slate-950/60 border border-slate-800 font-mono text-[11px] text-sky-300">
                    {step.detail || JSON.stringify(step)}
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  );
}
