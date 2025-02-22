package com.nmelo.todoapp.model;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
import java.time.chrono.ChronoLocalDate;
import java.time.format.DateTimeFormatter;

@Embeddable
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Deadline {
    private LocalDate startDate;
    private LocalDate dueDate;
    private LocalDate completedDate;

    public Deadline(LocalDate dueDate) {
        this.startDate = LocalDate.now();
        this.dueDate = dueDate;
        this.completedDate = null;
    }

    public String getDueDateFormated() {
        if(this.dueDate == null) return null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return this.dueDate.format(formatter);
    }

    public String getcompletedDateFormated() {
        if(this.completedDate == null) return null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return this.completedDate.format(formatter);
    }

    public boolean isOverdue() {
        return dueDate != null && LocalDate.now().isAfter(dueDate) && completedDate == null;
    }

    public void updateData(LocalDate dueDate) {
        this.dueDate = dueDate;
    }

    public void setCompletedDate() {
        this.completedDate = LocalDate.now();
    }

    public boolean isCompletedOnTime() {
        if (completedDate == null) {
            return false; // Se ainda não foi concluído, considera como não concluído no prazo
        }
        if (dueDate == null) {
            return false; // Se não houver uma data de vencimento, evita erro
        }
        return !completedDate.isAfter(dueDate); // Retorna true se completado no prazo
    }

}