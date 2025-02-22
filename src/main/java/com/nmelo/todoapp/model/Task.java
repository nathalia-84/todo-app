package com.nmelo.todoapp.model;

import com.nmelo.todoapp.model.dto.AddTaskDTO;
import com.nmelo.todoapp.model.dto.UpdateTaskDTO;
import jakarta.persistence.*;
import lombok.*;

@Table(name = "tasks")
@Entity
@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String description;
    @Enumerated(EnumType.STRING)
    private Status status;
    @Embedded
    private Deadline deadline;

    public Task(AddTaskDTO task) {
        this.title = task.title();
        this.description = task.description();
        this.status = Status.PENDING;
        this.deadline = new Deadline(task.dueDate());
    }

    public void updateData(UpdateTaskDTO task) {
        if(task.title() != null) {
            this.title = task.title();
        }
        if(task.description() != null) {
            this.description = task.description();
        }
        if(task.status() != null) {
            this.status = task.status();
        }
    }
}
