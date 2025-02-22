package com.nmelo.todoapp.model.dto;

import com.nmelo.todoapp.model.Status;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record UpdateTaskDTO(
        @NotNull
        String title,
        @NotNull
        String description,
        @NotNull
        Status status
) {
}
