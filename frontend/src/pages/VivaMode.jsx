import React, { useEffect, useState } from 'react';
import { HelpCircle, ChevronDown, ChevronUp, Search, BookOpen } from 'lucide-react';
import { fetchVivaQuestions } from '../services/api';

export default function VivaMode() {
  const [questions, setQuestions] = useState([]);
  const [search, setSearch] = useState('');
  const [openId, setOpenId] = useState(null);

  useEffect(() => {
    async function loadViva() {
      try {
        const res = await fetchVivaQuestions();
        setQuestions(res.questions || []);
      } catch (err) {
        console.error(err);
      }
    }
    loadViva();
  }, []);

  const filtered = questions.filter(q =>
    q.question.toLowerCase().includes(search.toLowerCase()) ||
    q.answer.toLowerCase().includes(search.toLowerCase()) ||
    q.category.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="p-8 space-y-8 max-w-5xl mx-auto">
      <div>
        <h1 className="text-2xl font-extrabold text-slate-100 flex items-center gap-2">
          <HelpCircle className="w-6 h-6 text-emerald-400" />
          University DBMS Viva Examination Preparation Portal
        </h1>
        <p className="text-slate-400 text-sm mt-1">
          A comprehensive Q&A bank covering RDBMS fundamentals, normalization, indexing, transactions, and SQL execution.
        </p>
      </div>

      {/* Search Input */}
      <div className="relative">
        <Search className="w-4 h-4 absolute left-3.5 top-3.5 text-slate-400" />
        <input
          type="text"
          placeholder="Search viva topic, question, or keyword..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full bg-slate-900 border border-slate-800 rounded-2xl pl-10 pr-4 py-3 text-xs text-slate-200 focus:outline-none focus:border-emerald-500"
        />
      </div>

      {/* Questions Accordion */}
      <div className="space-y-3">
        {filtered.map((item) => {
          const isOpen = openId === item.id;
          return (
            <div key={item.id} className="rounded-2xl glass-card border border-slate-800 overflow-hidden">
              <button
                onClick={() => setOpenId(isOpen ? null : item.id)}
                className="w-full p-4 text-left flex items-center justify-between hover:bg-slate-800/40 transition-colors"
              >
                <div className="flex items-center gap-3">
                  <span className="px-2.5 py-0.5 rounded-full text-[10px] font-bold bg-emerald-500/10 text-emerald-400 border border-emerald-500/20">
                    {item.category}
                  </span>
                  <span className="font-semibold text-slate-100 text-sm">{item.question}</span>
                </div>
                {isOpen ? <ChevronUp className="w-4 h-4 text-slate-400" /> : <ChevronDown className="w-4 h-4 text-slate-400" />}
              </button>

              {isOpen && (
                <div className="p-4 bg-slate-950/80 border-t border-slate-800 text-xs text-slate-300 leading-relaxed font-sans">
                  <strong className="text-emerald-400 block mb-1">Answer / Academic Explanation:</strong>
                  {item.answer}
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}
