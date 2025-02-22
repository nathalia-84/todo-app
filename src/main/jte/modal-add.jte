<div class="modal-content">
    <div class="modal-header">
        <h1 class="modal-title fs-5" id="addModalLabel">Add Task</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
        <form hx-post="/"
              hx-target="#taskTableBody"
              hx-swap="beforeend"
              hx-on::after-request="this.reset()">
            <div class="mb-3">
                <label for="title" class="col-form-label">Title:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="mb-3">
                <label for="description" class="col-form-label">Description:</label>
                <textarea class="form-control" id="description" name="description" required></textarea>
            </div>
            <div class="mb-3">
                <label for="date" class="col-form-label">Due Date:</label>
                <input type="date" class="form-control" id="date" name="dueDate" required>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
</div>



