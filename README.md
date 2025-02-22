# Todo App

## Overview

The Todo App is a simple task management application that allows users to create, manage, and delete tasks. The application is built using Spring MVC and Java, with a front-end that leverages Bootstrap for styling and HTMX for dynamic interactions without the need for full page reloads.

## Features

- Create new tasks with a title, description, and due date.
- View a list of all tasks with their details.
- Delete tasks from the list.
- Dynamic interactions using HTMX.
- Responsive design using Bootstrap.

## Technologies Used

- Java
- Spring MVC
- HTMX
- Bootstrap
- JTE (Java Template Engine)

## Getting Started

### Prerequisites

- Java 11 or higher
- Maven

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/nathalia-84/todo-app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd todo-app
   ```

3. Build the project using Maven:

   ```bash
   mvn clean install
   ```

4. Run the application:

   ```bash
   mvn spring-boot:run
   ```

5. Open your browser and navigate to `http://localhost:8080` to view the application.

## Usage

### Creating a New Task

1. Click on the "Add Task" button to open the task creation form.
2. Fill in the title, description, and due date.
3. Click "Save" to add the task to the list.

### Viewing Tasks

- The main page displays a list of all tasks with their details, including title, description, status, and due date.

### Deleting a Task

- Click the "Delete" button next to a task to remove it from the list.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. Ensure that your code adheres to the project's coding standards and includes appropriate tests.

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes and push the branch to your fork.
4. Create a pull request with a description of your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Spring MVC](https://spring.io/projects/spring-framework)
- [HTMX](https://htmx.org/)
- [Bootstrap](https://getbootstrap.com/)
- [JTE (Java Template Engine)](https://jte.gg/)

## Contact

For any questions or inquiries, please contact the repository owner at [nathalia-84](https://github.com/nathalia-84).