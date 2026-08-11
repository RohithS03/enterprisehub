import React, { useEffect, useState } from 'react';
import Sidebar from './components/Sidebar';
import Navbar from './components/Navbar';
import Dashboard from './pages/Dashboard';
import SchemaExplorer from './pages/SchemaExplorer';
import TableExplorer from './pages/TableExplorer';
import QueryExplorer from './pages/QueryExplorer';
import SqlPlayground from './pages/SqlPlayground';
import ObjectsView from './pages/ObjectsView';
import TransactionsDemo from './pages/TransactionsDemo';
import NormalizationGuide from './pages/NormalizationGuide';
import VivaMode from './pages/VivaMode';
import { fetchMetadata } from './services/api';

export default function App() {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [darkMode, setDarkMode] = useState(true);
  const [metadata, setMetadata] = useState(null);
  const [playgroundSql, setPlaygroundSql] = useState('');

  useEffect(() => {
    async function loadMeta() {
      try {
        const meta = await fetchMetadata();
        setMetadata(meta);
      } catch (err) {
        console.error(err);
      }
    }
    loadMeta();
  }, []);

  return (
    <div className={`min-h-screen flex ${darkMode ? 'dark bg-slate-950 text-slate-100' : 'bg-slate-50 text-slate-900'}`}>
      {/* Sidebar */}
      <Sidebar activeTab={activeTab} setActiveTab={setActiveTab} />

      {/* Main Content Area */}
      <div className="flex-1 flex flex-col min-w-0">
        <Navbar darkMode={darkMode} setDarkMode={setDarkMode} metadata={metadata} />

        <main className="flex-1 overflow-y-auto">
          {activeTab === 'dashboard' && <Dashboard metadata={metadata} setActiveTab={setActiveTab} />}
          {activeTab === 'schema' && <SchemaExplorer />}
          {activeTab === 'tables' && <TableExplorer />}
          {activeTab === 'queries' && <QueryExplorer setActiveTab={setActiveTab} setPlaygroundSql={setPlaygroundSql} />}
          {activeTab === 'playground' && <SqlPlayground initialSql={playgroundSql} />}
          {activeTab === 'objects' && <ObjectsView />}
          {activeTab === 'transactions' && <TransactionsDemo />}
          {activeTab === 'normalization' && <NormalizationGuide />}
          {activeTab === 'viva' && <VivaMode />}
        </main>
      </div>
    </div>
  );
}
