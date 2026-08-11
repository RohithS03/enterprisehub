# Normalization Specifications (1NF to BCNF)

1. **UNF**: Flat spreadsheet containing repeating multi-valued groups.
2. **1NF**: Atomic values enforced; primary key defined.
3. **2NF**: Partial functional dependencies removed by splitting junction tables (`employee_projects`, `order_items`, `book_authors`, `book_copies`, `inventory`).
4. **3NF**: Transitive functional dependencies removed (e.g. `department_name -> location_city` split into `departments` and `locations`).
5. **BCNF**: Every determinant $X \to Y$ is a Super Key. All 18 EnterpriseHub tables adhere to BCNF.
