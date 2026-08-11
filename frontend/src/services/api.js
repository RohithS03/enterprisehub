const API_BASE = '/api';

export async function fetchMetadata() {
  const res = await fetch(`${API_BASE}/metadata`);
  if (!res.ok) throw new Error('Failed to fetch DB metadata');
  return res.json();
}

export async function fetchTableDetails(tableName) {
  const res = await fetch(`${API_BASE}/schema/table/${encodeURIComponent(tableName)}`);
  if (!res.ok) throw new Error(`Failed to fetch schema for ${tableName}`);
  return res.json();
}

export async function fetchQueries(category = 'all', difficulty = 'all') {
  const query = new URLSearchParams({ category, difficulty }).toString();
  const res = await fetch(`${API_BASE}/queries?${query}`);
  if (!res.ok) throw new Error('Failed to fetch query catalog');
  return res.json();
}

export async function executeSql(sql, confirmDestructive = false) {
  const res = await fetch(`${API_BASE}/sql/execute`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ sql, confirm_destructive: confirmDestructive })
  });
  return res.json();
}

export async function fetchVivaQuestions() {
  const res = await fetch(`${API_BASE}/viva/questions`);
  if (!res.ok) throw new Error('Failed to fetch viva questions');
  return res.json();
}

export async function runTransactionDemo(action = 'commit') {
  const res = await fetch(`${API_BASE}/transactions/demo`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ action })
  });
  return res.json();
}
