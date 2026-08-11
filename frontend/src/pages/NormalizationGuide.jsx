import React from 'react';
import { Layers, ArrowDown, CheckCircle, ShieldAlert } from 'lucide-react';

export default function NormalizationGuide() {
  const steps = [
    {
      stage: 'UNF (Unnormalized Form)',
      badge: 'Redundant & Anomalous',
      badgeColor: 'text-rose-400 bg-rose-500/10 border-rose-500/20',
      problem: 'Single flat spreadsheet storing Employee, Department, Manager Name, Project Name, and Working Hours together.',
      example: 'EmpID, EmpName, DeptName, ManagerName, Proj1Name, Proj1Hours, Proj2Name, Proj2Hours (Repeating Groups & Multi-valued attributes).',
      solution: 'Separate repeating groups into distinct rows with atomic attributes.'
    },
    {
      stage: '1NF (First Normal Form)',
      badge: 'Atomic Values',
      badgeColor: 'text-amber-400 bg-amber-500/10 border-amber-500/20',
      problem: 'All attribute values are atomic (no arrays or comma-separated lists), but composite Primary Key (employee_id, project_id) exists.',
      example: 'Table: (employee_id, project_id, emp_name, emp_salary, dept_name, project_name, hours_worked).',
      solution: 'Eliminate partial dependencies where non-key attributes depend on only part of the composite primary key.'
    },
    {
      stage: '2NF (Second Normal Form)',
      badge: 'No Partial Dependencies',
      badgeColor: 'text-sky-400 bg-sky-500/10 border-sky-500/20',
      problem: 'Table is in 1NF. Partial dependency removed: emp_name depends solely on employee_id, not project_id. Splitting into employees and employee_projects.',
      example: 'employees(employee_id PK, emp_name, salary, dept_name, manager_name) vs employee_projects(employee_id FK, project_id FK, hours_worked).',
      solution: 'Eliminate transitive dependencies where non-key attributes depend on other non-key attributes.'
    },
    {
      stage: '3NF (Third Normal Form)',
      badge: 'No Transitive Dependencies',
      badgeColor: 'text-emerald-400 bg-emerald-500/10 border-emerald-500/20',
      problem: 'Table is in 2NF. Transitive dependency removed: dept_name -> location_city. Department attributes split into dedicated departments and locations tables.',
      example: 'employees(employee_id PK, name, salary, department_id FK), departments(department_id PK, name, location_id FK), locations(location_id PK, city, country).',
      solution: 'Ensure every determinant is a Super Key (BCNF).'
    },
    {
      stage: 'BCNF (Boyce-Codd Normal Form)',
      badge: 'Strict Super Key Determinant',
      badgeColor: 'text-purple-400 bg-purple-500/10 border-purple-500/20',
      problem: 'For every functional dependency X -> Y, X MUST be a Super Key.',
      example: 'EnterpriseHub database schema strictly enforces BCNF across all 18 tables with 0 redundancy and lossless join decomposition.',
      solution: 'EnterpriseHub Relational Schema Achieved.'
    }
  ];

  return (
    <div className="p-8 space-y-8 max-w-7xl mx-auto">
      <div>
        <h1 className="text-2xl font-extrabold text-slate-100 flex items-center gap-2">
          <Layers className="w-6 h-6 text-emerald-400" />
          Database Normalization (UNF to BCNF)
        </h1>
        <p className="text-slate-400 text-sm mt-1">
          A step-by-step educational guide demonstrating how EnterpriseHub tables were normalized from unnormalized flat data to BCNF.
        </p>
      </div>

      <div className="space-y-6">
        {steps.map((step, idx) => (
          <div key={idx} className="p-6 rounded-2xl glass-card space-y-3 relative">
            <div className="flex items-center justify-between">
              <h3 className="font-bold text-slate-100 text-base">{step.stage}</h3>
              <span className={`px-3 py-1 rounded-full text-xs font-semibold border ${step.badgeColor}`}>
                {step.badge}
              </span>
            </div>

            <div className="text-xs text-slate-300">
              <strong className="text-slate-400">Issue / State:</strong> {step.problem}
            </div>

            <div className="p-3 rounded-xl bg-slate-950/80 border border-slate-800 font-mono text-xs text-slate-300">
              {step.example}
            </div>

            <div className="text-xs text-emerald-400 font-semibold flex items-center gap-1.5 pt-1">
              <CheckCircle className="w-4 h-4 shrink-0" />
              <span>Transformation: {step.solution}</span>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
