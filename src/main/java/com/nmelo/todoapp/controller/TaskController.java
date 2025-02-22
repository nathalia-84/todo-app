package com.nmelo.todoapp.controller;

import com.nmelo.todoapp.model.Status;
import com.nmelo.todoapp.model.dto.UpdateTaskDTO;
import com.nmelo.todoapp.repository.TaskRepository;
import com.nmelo.todoapp.model.dto.AddTaskDTO;
import com.nmelo.todoapp.model.dto.ListTasksDTO;
import com.nmelo.todoapp.model.Task;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TaskController {
    private static final Logger log = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskRepository taskRepository;

    @GetMapping("/")
    public String index(Model model, @PageableDefault(size = 10, sort = {"status"}) Pageable pageable) {
        log.info("Fetching tasks page: {}", pageable.getPageNumber());
        Page<ListTasksDTO> tasks = taskRepository.findAll(pageable)
                .map(ListTasksDTO::new);
        model.addAttribute("tasks", tasks);
        return "index";
    }

    @PostMapping("/")
    @Transactional
    public String createTask(@ModelAttribute @Valid AddTaskDTO newTask, Model model) {
        log.info("Creating new task: {}", newTask.title());
        var addNewTask = new ListTasksDTO(taskRepository.save(new Task(newTask)));
        model.addAttribute("task", addNewTask);
        return "task-row";
    }

    @PutMapping("/{id}")
    @Transactional
    public String updateTask(@PathVariable Long id,@ModelAttribute @Valid UpdateTaskDTO updateTaskDTO, Model model) {
        var oldTask = taskRepository.getReferenceById(id);
        oldTask.updateData(updateTaskDTO);
        log.info("Updating task: {}", oldTask);
        var updatedTask = new ListTasksDTO(oldTask);
        if (updatedTask.status() == Status.DONE) {
            updatedTask.deadline().setCompletedDate();
        }
        model.addAttribute("task", updatedTask);
        return "task-row";
    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<Object> deleteTask(@PathVariable String id) {
        taskRepository.deleteById(Long.valueOf(id));
        log.info("Task with id: {} was deleted.", id);
        return ResponseEntity.ok().build();
    }
}
