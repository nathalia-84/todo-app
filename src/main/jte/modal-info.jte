@param com.nmelo.todoapp.model.dto.ListTasksDTO task

<div class="modal-content">
    <div class="modal-header">
        <h1 class="modal-title fs-5" id="infoModalLabel">
            Task Details
        </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>

    <div class="modal-body">
        <div class="mb-3">
            <label class="col-form-label"><strong>Title:</strong></label>
            <p>${task.title()}</p>
        </div>
        <div class="mb-3">
            <label class="col-form-label"><strong>Description:</strong></label>
            <p>${task.description()}</p>
        </div>
        <div class="mb-3">
            <label class="col-form-label"><strong>Status:</strong></label>
            <p class="text-success">✅ Done</p>
        </div>
        <div class="mb-3">
            <label class="col-form-label"><strong>Due Date:</strong></label>
            <p>${task.deadline().getDueDateFormated()}</p>
        </div>
        <div class="mb-3">
            <label class="col-form-label"><strong>Completed Date:</strong></label>
            <p>${task.deadline().getcompletedDateFormated()}</p>
        </div>
        <div class="mb-3">
            <label class="col-form-label"><strong>Completion Status:</strong></label>
            @if(task.deadline().isCompletedOnTime())
                <p>✅ Completed on time!</p>
            @else
                <p>❌ Completed late!</p>
            @endif
        </div>
    </div>
</div>




