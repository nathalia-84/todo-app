@import com.nmelo.todoapp.model.Status
@param com.nmelo.todoapp.model.dto.ListTasksDTO task

<div class="modal-content">
    <div class="modal-header">
        <h1 class="modal-title fs-5" id="editModalLabel">
            Edit Task
        </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>

    <div class="modal-body">
        <form hx-put="/${task.id()}"
              hx-target="#task-${task.id()}"
              hx-swap="outerHTML"
              hx-on::after-request="this.reset()">
            <div class="mb-3">
                <label for="title" class="col-form-label">Title:</label>
                <input type="text" class="form-control" id="title" name="title" value="${task.title()}" required>
            </div>
            <div class="mb-3">
                <label for="description" class="col-form-label">Description:</label>
                <textarea class="form-control" id="description" name="description"
                          required>${task.description()}</textarea>
            </div>
            <div class="mb-3">
                <label for="status" class="col-form-label">Status:</label>
                <select class="form-select" id="status" aria-label="Default select example" name="status" required>
                    @if(task.status() == Status.PENDING)
                        <option value="${Status.PENDING}" selected>Pending</option>
                        <option value="${Status.IN_PROGRESS}">In Progress</option>
                        <option value="${Status.DONE}">Done</option>
                    @else
                        <option value="${Status.PENDING}">Pending</option>
                        <option value="${Status.IN_PROGRESS}" selected>In Progress</option>
                        <option value="${Status.DONE}">Done</option>
                    @endif
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
</div>




