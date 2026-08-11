import React, { useEffect, useState } from 'react';
import { Database, Table, Key, Filter } from 'lucide-react';
import { fetchMetadata, fetchTableDetails } from '../services/api';
import SqlTable from '../components/SqlTable';

export default function TableExplorer() {
  const [tablesList, setTablesList] = useState([]);
  const [selectedTable, setSelectedTable] = useState('employees');
  const [tableData, setTableData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadTables() {
      try {
        const meta = await fetchMetadata();
        setTablesList(meta.tables || []);
      } catch (err) {
        console.error(err);
      }
    }
    loadTables();
  }, []);

  useEffect(() => {
    if (selectedTable) {
      loadDetails(selectedTable);
    }
  }, [selectedTable]);

  async function loadDetails(name) {
    setLoading(true);
    try {
      const res = await fetchTableDetails(name);
      setTableData(res);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  }

  const sampleCols = tableData?.sample_rows && tableData.sample_rows.length > 0 ? Object.keys(tableData.sample_rows[0]) : [];

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      <div>
        <h1 className="text-2xl font-extrabold text-slate-100 flex items-center gap-2">
          <Database className="w-6 h-6 text-emerald-400" />
          Enterprise Table Explorer
        </h1>
        <p className="text-slate-400 text-sm mt-1">
          Inspect schema definitions, data types, foreign keys, and sample tuples across all 18 relational tables.
        </p>
      </div>

      {/* Table Selector Dropdown / Grid */}
      <div className="p-4 rounded-2xl glass-card flex items-center justify-between">
        <div className="flex items-center gap-2 text-xs text-slate-400 font-semibold uppercase tracking-wider">
          <Filter className="w-4 h-4 text-emerald-400" />
          <span>Select Table ({tablesList.length} total):</span>
        </div>
        <select
          value={selectedTable}
          onChange={(e) => setSelectedTable(e.target.value)}
          className="bg-slate-950/80 border border-slate-800 rounded-xl px-4 py-2 text-xs font-mono text-emerald-400 focus:outline-none focus:border-emerald-500"
        >
          {tablesList.map((t) => (
            <option key={t.table_name} value={t.table_name}>
              {t.table_name} ({t.row_count} rows)
            </option>
          ))}
        </select>
      </div>

      {/* Schema Structure Card */}
      {tableData && (
        <div className="p-6 rounded-2xl glass-card space-y-4">
          <div className="flex items-center justify-between border-b border-slate-800 pb-3">
            <h3 className="font-bold text-slate-100 text-base font-mono uppercase text-emerald-400">
              Table Structure: {tableData.table_name}
            </h3>
            <span className="text-xs text-slate-400">Total Tuples: <strong className="text-slate-200">{tableData.total_rows}</strong></span>
          </div>

          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-2">
            {tableData.columns.map((col) => (
              <div key={col.name} className="p-3 rounded-xl bg-slate-950/60 border border-slate-800 text-xs font-mono">
                <div className="font-bold text-slate-200 truncate">{col.name}</div>
                <div className="text-[10px] text-slate-500 mt-0.5">{col.type}</div>
                {col.pk === 1 && <span className="inline-block mt-1 text-[9px] px-1.5 py-0.5 rounded bg-amber-500/10 text-amber-400 border border-amber-500/20 font-bold">PRIMARY KEY</span>}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Sample Data Table */}
      <div className="p-6 rounded-2xl glass-card space-y-4">
        <h3 className="font-bold text-slate-100 text-base">Sample Data Rows (Top 10)</h3>
        {loading ? (
          <div className="p-8 text-center text-slate-500 text-xs font-mono">Loading table data...</div>
        ) : (
          <SqlTable columns={sampleCols} rows={tableData?.sample_rows || []} />
        )}
      </div>
    </div>
  );
}
