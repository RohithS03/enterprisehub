import React from 'react';

export default function SqlTable({ columns, rows, executionTime }) {
  if (!columns || columns.length === 0) {
    return <div className="p-8 text-center text-slate-500 text-xs font-mono">No result columns returned.</div>;
  }

  return (
    <div className="space-y-2">
      <div className="flex items-center justify-between text-xs text-slate-400 px-1">
        <span>Returned <strong className="text-slate-200">{rows ? rows.length : 0}</strong> record(s)</span>
        {executionTime && <span className="font-mono text-emerald-400">Time: {executionTime}ms</span>}
      </div>

      <div className="overflow-x-auto rounded-xl border border-slate-800 bg-slate-950/80">
        <table className="w-full text-left text-xs text-slate-300">
          <thead className="bg-slate-900 text-slate-400 font-mono text-[11px] uppercase tracking-wider border-b border-slate-800">
            <tr>
              {columns.map((col) => (
                <th key={col} className="p-3 font-semibold">{col}</th>
              ))}
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-800/60 font-mono">
            {rows && rows.length > 0 ? (
              rows.map((row, idx) => (
                <tr key={idx} className="hover:bg-slate-900/60 transition-colors">
                  {columns.map((col) => (
                    <td key={col} className="p-3 text-slate-200 whitespace-nowrap">
                      {row[col] === null ? <span className="text-slate-600 italic">NULL</span> : String(row[col])}
                    </td>
                  ))}
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan={columns.length} className="p-6 text-center text-slate-500">Query returned empty set (0 rows).</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
