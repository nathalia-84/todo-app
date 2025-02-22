package com.nmelo.todoapp.repository;

import com.nmelo.todoapp.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task, Long> {
}
