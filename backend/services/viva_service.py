# University DBMS Viva Preparation Question & Answer Bank

VIVA_QUESTIONS = [
    {
        "id": 1,
        "question": "What is a DBMS? What is an RDBMS?",
        "answer": "A Database Management System (DBMS) is software for storing, retrieving, and managing data. A Relational DBMS (RDBMS) organizes data into tables (relations) connected by Primary Key-Foreign Key relationships adhering to relational algebra.",
        "category": "Fundamentals"
    },
    {
        "id": 2,
        "question": "What is the difference between Primary Key, Candidate Key, and Foreign Key?",
        "answer": "A Candidate Key uniquely identifies a tuple. The Primary Key (PK) is the chosen candidate key (must be NOT NULL & UNIQUE). A Foreign Key (FK) is an attribute referencing a Primary Key in another table to enforce referential integrity.",
        "category": "Keys & Constraints"
    },
    {
        "id": 3,
        "question": "What are the DDL, DML, DCL, and TCL categories in SQL?",
        "answer": "DDL (CREATE, ALTER, DROP) defines schema structure. DML (INSERT, SELECT, UPDATE, DELETE) manipulates rows. DCL (GRANT, REVOKE) controls security permissions. TCL (COMMIT, ROLLBACK, SAVEPOINT) manages transaction state.",
        "category": "SQL Categories"
    },
    {
        "id": 4,
        "question": "What is Normalization? Explain 1NF, 2NF, 3NF, and BCNF.",
        "answer": "Normalization eliminates data redundancy and update anomalies. 1NF eliminates atomic repeating groups. 2NF eliminates partial functional dependencies (non-key dependent on part of composite PK). 3NF eliminates transitive dependencies (non-key dependent on non-key). BCNF requires that for every functional dependency X -> Y, X must be a Super Key.",
        "category": "Normalization"
    },
    {
        "id": 5,
        "question": "What is the difference between WHERE and HAVING clauses?",
        "answer": "WHERE filters individual rows BEFORE grouping is performed. HAVING filters aggregated groups AFTER GROUP BY execution.",
        "category": "Querying & Aggregation"
    },
    {
        "id": 6,
        "question": "What is a Correlated Subquery?",
        "answer": "A correlated subquery is a nested subquery that references attributes from the outer query. It is evaluated once for each candidate row processed by the outer query.",
        "category": "Subqueries"
    },
    {
        "id": 7,
        "question": "What are ACID Properties in DBMS?",
        "answer": "Atomicity (all-or-nothing completion), Consistency (database transitions from one valid state to another), Isolation (concurrent transactions execute independently without interference), and Durability (committed changes persist permanently).",
        "category": "Transactions"
    },
    {
        "id": 8,
        "question": "Difference between INNER JOIN, LEFT JOIN, and RIGHT JOIN?",
        "answer": "INNER JOIN returns only matching rows from both tables. LEFT JOIN returns all rows from the left table and matched rows from the right (filling NULLs for non-matches). RIGHT JOIN returns all rows from the right table.",
        "category": "Joins"
    },
    {
        "id": 9,
        "question": "What is a Database View? Why is it useful?",
        "answer": "A View is a virtual table defined by a stored SELECT query. It simplifies complex joins, enhances security by restricting column visibility, and provides logical data independence.",
        "category": "Views & Indexes"
    },
    {
        "id": 10,
        "question": "What is a B-Tree Index? What are the trade-offs of indexing?",
        "answer": "A B-Tree index creates a self-balancing search tree mapping indexed values to record locations, drastically speeding up SELECT lookups. Trade-offs: increases storage space and slows down INSERT, UPDATE, and DELETE operations due to tree rebalancing.",
        "category": "Views & Indexes"
    },
    {
        "id": 11,
        "question": "Difference between DELETE, DROP, and TRUNCATE?",
        "answer": "DELETE is a DML statement that removes rows conditionally and can be rolled back. TRUNCATE is a DDL statement that removes all rows by deallocating pages (faster, resets auto-increment). DROP is a DDL statement that deletes table schema and data entirely.",
        "category": "SQL Categories"
    },
    {
        "id": 12,
        "question": "What is a Stored Procedure vs Stored Function?",
        "answer": "A Stored Procedure executes business logic, can accept IN/OUT parameters, and does not need to return a value. A Stored Function must return a scalar value and can be invoked directly within SQL SELECT statements.",
        "category": "Programmability"
    },
    {
        "id": 13,
        "question": "What is a Database Trigger?",
        "answer": "A Trigger is a stored SQL block automatically executed in response to a specific DML event (BEFORE/AFTER INSERT, UPDATE, or DELETE) on a table.",
        "category": "Programmability"
    },
    {
        "id": 14,
        "question": "Difference between UNION and UNION ALL?",
        "answer": "UNION combines result sets of two queries and removes duplicate rows. UNION ALL combines result sets without deduplication (faster).",
        "category": "Set Operations"
    },
    {
        "id": 15,
        "question": "What is a Window Function? How does ROW_NUMBER() differ from RANK()?",
        "answer": "A Window Function computes aggregate values across a set of related rows without collapsing rows into a single summary. ROW_NUMBER() assigns strict sequential integers (1, 2, 3), whereas RANK() assigns duplicate ranks for tied values and skips subsequent rank numbers.",
        "category": "Advanced SQL"
    }
]

def get_viva_questions():
    return VIVA_QUESTIONS
