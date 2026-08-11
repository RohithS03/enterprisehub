import React, { useEffect, useState } from 'react';
import { Search, Play, Code2, Tag, Layers, CheckCircle } from 'lucide-react';
import { fetchQueries, executeSql } from '../services/api';
import SqlTable from '../components/SqlTable';

export default function QueryExplorer({ setActiveTab, setPlaygroundSql }) {
  const [queries, setQueries] = useState([]);
  const [category, setCategory] = useState('all');
  const [search, setSearch] = useState('');
  const [activeQuery, setActiveQuery] = useState(null);
  const [queryResult, setQueryResult] = useState(null);
  const [executing, setExecuting] = useState(false);
  const [execTime, setExecTime] = useState(null);

  useEffect(() => {
    loadQueries();
  }, [category]);

  async function loadQueries() {
    try {
      const res = await fetchQueries(category);
      setQueries(res.queries || []);
    } catch (err) {
      console.error(err);
    }
  }

  async function handleRunQuery(q) {
    setActiveQuery(q);
    setExecuting(true);
    setQueryResult(null);
    const start = performance.now();
    try {
      const res = await executeSql(q.sql);
      setQueryResult(res.result);
    } catch (err) {
      console.error(err);
    } finally {
      const duration = (performance.now() - start).toFixed(1);
      setExecTime(duration);
      setExecuting(false);
    }
  }

  const filteredQueries = queries.filter(q =>
    q.name.toLowerCase().includes(search.toLowerCase()) ||
    q.concept.toLowerCase().includes(search.toLowerCase()) ||
    q.sql.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      <div>
        <h1 className="text-2xl font-extrabold text-slate-100 flex items-center gap-2">
          <Code2 className="w-6 h-6 text-emerald-400" />
          Master SQL Query Catalog (100+ Unique Queries)
        </h1>
        <p className="text-slate-400 text-sm mt-1">
          Explore categorized SQL queries spanning Basic DML, Aggregations, Joins, Correlated Subqueries, Window Functions, and Level 1-5 Interview Challenges.
        </p>
      </div>

      {/* Filter Bar */}
      <div className="p-4 rounded-2xl glass-card flex flex-col md:flex-row gap-4 justify-between items-center">
        <div className="relative w-full md:w-80">
          <Search className="w-4 h-4 absolute left-3.5 top-3 text-slate-400" />
          <input
            type="text"
            placeholder="Search query name, concept, or SQL..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="w-full bg-slate-950/60 border border-slate-800 rounded-xl pl-10 pr-4 py-2 text-xs text-slate-200 focus:outline-none focus:border-emerald-500"
          />
        </div>

        <div className="flex items-center gap-2 overflow-x-auto w-full md:w-auto">
          {['all', 'Basic SQL', 'Aggregation', 'Joins', 'Subqueries', 'Advanced Window Functions', 'CASE & Functions', 'Advanced Relational Challenges'].map((cat) => (
            <button
              key={cat}
              onClick={() => setCategory(cat)}
              className={`px-3 py-1.5 rounded-xl text-xs font-semibold whitespace-nowrap transition-all ${
                category === cat
                  ? 'bg-emerald-500 text-white shadow-md shadow-emerald-500/20'
                  : 'bg-slate-950/60 text-slate-400 hover:text-slate-200 border border-slate-800'
              }`}
            >
              {cat === 'all' ? 'All Categories' : cat}
            </button>
          ))}
        </div>
      </div>

      {/* Active Query Execution Result Display */}
      {activeQuery && (
        <div className="p-6 rounded-2xl glass-card border border-emerald-500/30 bg-emerald-500/5 space-y-4">
          <div className="flex items-center justify-between">
            <div>
              <span className="text-[10px] font-bold uppercase tracking-wider text-emerald-400">Executing Query #{activeQuery.id}</span>
              <h3 className="font-bold text-slate-100 text-base">{activeQuery.name}</h3>
            </div>
            <button
              onClick={() => { setPlaygroundSql(activeQuery.sql); setActiveTab('playground'); }}
              className="px-3 py-1.5 rounded-lg bg-slate-800 text-xs font-semibold text-sky-400 border border-slate-700 hover:bg-slate-700"
            >
              Open in Sandbox
            </button>
          </div>

          <pre className="p-3 rounded-xl bg-slate-950 border border-slate-800 font-mono text-xs text-slate-200 overflow-x-auto">
            {activeQuery.sql}
          </pre>

          {executing ? (
            <div className="p-4 text-center text-xs text-slate-400 font-mono">Executing query against SQLite/MySQL engine...</div>
          ) : queryResult ? (
            <SqlTable columns={queryResult.columns} rows={queryResult.rows} executionTime={execTime} />
          ) : null}
        </div>
      )}

      {/* Query Cards Catalog */}
      <div className="space-y-4">
        <div className="text-xs font-semibold text-slate-400 uppercase tracking-wider">
          Showing {filteredQueries.length} Executable Queries
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          {filteredQueries.map((q) => (
            <div key={q.id} className="p-5 rounded-2xl glass-card border border-slate-800 flex flex-col justify-between space-y-3">
              <div>
                <div className="flex items-center justify-between mb-2">
                  <span className="px-2.5 py-0.5 rounded-full text-[10px] font-bold bg-slate-800 text-slate-300 border border-slate-700">
                    {q.difficulty}
                  </span>
                  <span className="text-[10px] font-mono text-emerald-400 font-bold">Query #{q.id}</span>
                </div>
                <h4 className="font-bold text-slate-100 text-sm">{q.name}</h4>
                <p className="text-xs text-slate-400 mt-1 leading-relaxed">{q.explanation}</p>
              </div>

              <div className="space-y-2 pt-2 border-t border-slate-800/80">
                <pre className="p-2.5 rounded-lg bg-slate-950 border border-slate-800/80 font-mono text-[11px] text-slate-300 overflow-x-auto truncate">
                  {q.sql}
                </pre>
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-1 text-[10px] text-slate-500 font-mono">
                    <Tag className="w-3 h-3 text-sky-400" />
                    <span>{q.concept}</span>
                  </div>
                  <button
                    onClick={() => handleRunQuery(q)}
                    className="px-3 py-1.5 rounded-lg bg-emerald-500/10 hover:bg-emerald-500/20 text-emerald-400 text-xs font-semibold border border-emerald-500/20 flex items-center gap-1.5 transition-colors"
                  >
                    <Play className="w-3 h-3" />
                    <span>Run Query</span>
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
