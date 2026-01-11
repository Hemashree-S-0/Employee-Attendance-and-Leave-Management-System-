CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role VARCHAR(20) CHECK (role IN ('ADMIN','EMPLOYEE')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    full_name VARCHAR(100),
    phone VARCHAR(15),
    department VARCHAR(50),
    designation VARCHAR(50),
    date_of_joining DATE,
    status VARCHAR(20) DEFAULT 'ACTIVE'
);

CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    date DATE,
    punch_in TIME,
    punch_out TIME,
    total_hours INTERVAL,
    status VARCHAR(20)
);

CREATE TABLE leaves (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    type VARCHAR(20),
    reason TEXT,
    from_date DATE,
    to_date DATE,
    status VARCHAR(20) DEFAULT 'PENDING',
    admin_remarks TEXT
);
