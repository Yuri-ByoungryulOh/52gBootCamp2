class TodoApp:
    def __init__(self):
        self.tasks = []

    def add_task(self, task):
        """Add a task to the list."""
        if task in self.tasks:
            return f"'{task}' already exists in the list."
        self.tasks.append(task)
        return f"'{task}' added successfully."

    def remove_task(self, task):
        """Remove a task from the list."""
        if task not in self.tasks:
            return f"'{task}' not found in the list."
        self.tasks.remove(task)
        return f"'{task}' removed successfully."

    def complete_task(self, task):
        """Mark a task as complete. A completed task has 'DONE: ' prefix."""
        if task not in self.tasks:
            return f"'{task}' not found in the list."
        index = self.tasks.index(task)
        self.tasks[index] = "DONE: " + task
        return f"'{task}' marked as complete."

    def view_tasks(self):
        """Return the list of tasks."""
        return self.tasks


# DEMO
if __name__ == "__main__":
    # Initialize the app
    app = TodoApp()

    # Add tasks to the list
    print(app.add_task("Buy groceries"))  # Expected: 'Buy groceries' added successfully.
    print(app.add_task("Complete homework"))  # Expected: 'Complete homework' added successfully.
    print(app.add_task("Buy groceries"))  # Expected: 'Buy groceries' already exists in the list.

    # View current tasks
    print(app.view_tasks())  # Expected: ['Buy groceries', 'Complete homework']
