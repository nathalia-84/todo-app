CREATE TABLE tasks (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    status VARCHAR(50) NOT NULL,
    start_date TIMESTAMP,
    due_date TIMESTAMP,
    completed_date TIMESTAMP
);