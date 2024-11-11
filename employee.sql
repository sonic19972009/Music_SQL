CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    department VARCHAR(50),
    director_id INTEGER,
    FOREIGN KEY (director_id) REFERENCES Employee(employee_id)
);