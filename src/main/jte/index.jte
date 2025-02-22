@import com.nmelo.todoapp.model.dto.ListTasksDTO
@import org.springframework.data.domain.Page

@param Page<ListTasksDTO> tasks

<!doctype html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Task Manager</title>
    <script src="https://unpkg.com/htmx.org@2.0.4"
            integrity="sha384-HGfztofotfshcF7+8n44JQL2oJmowVChPTg48S+jvZoztPfvwD79OC/LTtG6dMp+"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="">
<div id="alert-container"></div>
<div class="container mt-5">
    <div class="py-4">
        <div class="px-4">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h1 class="h4">Task Manager</h1>
                    <p class="text-white-50">A list of all your tasks including their description and status.</p>
                </div>
                <div>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAdd">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5zM3 3H2v1h1z"></path>
                            <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1z"></path>
                            <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5zM2 7h1v1H2zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm1 .5H2v1h1z"></path>
                        </svg>
                        New Task
                    </button>
                </div>
            </div>
            <div class="container mt-4">
                <div class="table-responsive">
                    <table class="table table-striped w-100 align-middle">
                        <thead>
                        <tr>
                            <th>Title</th>
                            <th>Status</th>
                            <th>Description</th>
                            <th>Due Date</th>
                            <th class="text-end">Actions</th>
                        </tr>
                        </thead>
                        <tbody id="taskTableBody" class="table-group-divider">
                        @for(ListTasksDTO task : tasks)
                            @template.task-row(task = task)
                        @endfor
                        </tbody>
                    </table>
                </div>

                <!-- Controles de Paginação -->
                <nav>
                    <ul class="pagination justify-content-center">
                        <!-- Botão "Anterior" -->
                        @if(tasks.hasPrevious())
                            <li class="page-item">
                                <a class="page-link" href="?page=${tasks.getNumber() - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo; Anterior</span>
                                </a>
                            </li>
                        @endif

                        <!-- Números das Páginas -->
                        @for(int i = 0; i < tasks.getTotalPages(); i++)
                            <li class="page-item @{i == tasks.getNumber() ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}">${i + 1}</a>
                            </li>
                        @endfor

                        <!-- Botão "Próximo" -->
                        @if(tasks.hasNext())
                            <li class="page-item">
                                <a class="page-link" href="?page=${tasks.getNumber() + 1}" aria-label="Next">
                                    <span aria-hidden="true">Próximo &raquo;</span>
                                </a>
                            </li>
                        @endif
                    </ul>
                </nav>
            </div>

        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        @template.modal-add()
    </div>
</div>

<script>
    document.body.addEventListener('htmx:afterRequest', function(event) {
        const verb = event.detail.requestConfig.verb.toUpperCase();
        const successful = event.detail.successful;

        let message = "";
        let type = "";

        if (successful) {
            if (verb === "POST") {
                message = "✅ Success! Task added successfully.";
                type = "success";
            } else if (verb === "PUT") {
                message = "✅ Success! Task updated successfully.";
                type = "info";
            } else if (verb === "DELETE") {
                message = "✅ Success! Task deleted successfully.";
                type = "warning";
            } else {
                message = "✅ Operation completed successfully.";
                type = "success";
            }
        } else {
            if (verb === "POST") {
                message = "❌ Error! Failed to add the task.";
                type = "danger";
            } else if (verb === "PUT") {
                message = "❌ Error! Failed to update the task.";
                type = "danger";
            } else if (verb === "DELETE") {
                message = "❌ Error! Failed to delete the task.";
                type = "danger";
            } else {
                message = "❌ Error! Something went wrong.";
                type = "danger";
            }
        }

        showAlert(message, type);
    });

    function showAlert(message, type) {
        const alertContainer = document.getElementById('alert-container');

        // Escape `${}` to avoid conflicts with JTE
        const alert = document.createElement('div');
        alert.className = "alert alert-" + type + " alert-dismissible fade show";
        alert.setAttribute("role", "alert");
        alert.style.position = "fixed";
        alert.style.top = "10px";
        alert.style.left = "10px";
        alert.style.zIndex = "1050";
        alert.innerHTML = message + `
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        `;

        // Clear previous alert and append new one
        alertContainer.innerHTML = "";
        alertContainer.appendChild(alert);

        // Automatically remove the alert after 5 seconds
        setTimeout(() => {
            alert.remove();
        }, 3000);
    }
</script>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>