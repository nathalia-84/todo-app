package com.nmelo.todoapp.model.dto;

import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record AddTaskDTO(
        @NotNull
        String title,
        @NotNull
        String description,
        @NotNull
        LocalDate dueDate
) {
}
