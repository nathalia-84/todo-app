package com.nmelo.todoapp.model.dto;

import com.nmelo.todoapp.model.Deadline;
import com.nmelo.todoapp.model.Status;
import com.nmelo.todoapp.model.Task;

public record ListTasksDTO(
        Long id,
        String title,
        String description,
        Status status,
        Deadline deadline
) {
    public ListTasksDTO(Task task) {
        this(
                task.getId(),
                task.getTitle(),
                task.getDescription(),
                task.getStatus(),
                task.getDeadline()
        );
    }
}
