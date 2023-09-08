import pytest
from todo import TodoApp


# Initialize the app, use fixture
@pytest.fixture(scope='session')
def app():
    """Returns a fresh instance of the todoapp with an empty task list."""
    return TodoApp()


class TestTodo:
    # Add task 'Buy groceries' to the list
    # Expected: 'Buy groceries' added successfully.
    # 힌트
    # def test_add_new_task_1(...):
    #     ... # call add_task function
    #     ... # check 'Buy groceries' is in the results of view_tasks() function
    def test_add_new_task_1(self, app):
        new_task = 'Buy groceries'
        tasks = app.view_tasks()
        result = app.add_task(task=new_task)
        assert new_task in tasks

    # Add task 'Complete homework' to the list
    # Expected: 'Complete homework' added successfully.
    def test_add_new_task_2(self, app):
        new_task = 'Complete homework'
        result = app.add_task(task=new_task)
        assert new_task in app.tasks

    # Add task 'Buy groceries' that already exists in the list
    # Expected: 'Buy groceries' already exists in the list.
    def test_check_task_in_list(self, app):
        new_task = 'Buy groceries'
        result = app.add_task(task=new_task)
        assert new_task in app.tasks

    # View current tasks
    # Expected: ['Buy groceries', 'Complete homework']
    def test_view_current_tasks(self, app):
        assert len(app.tasks) == 2

    # Mark a task 'Buy groceries' as complete
    # Expected: 'Buy groceries' marked as complete. ['DONE: Buy groceries', 'Complete homework']
    def test_complete(self, app):
        target_task = 'Buy groceries'
        result = app.complete_task(task=target_task)
        assert app.tasks[0][:4] == 'DONE'

    # Try marking a non-existent task 'Go jogging' as complete
    # Expected: 'Go jogging' not found in the list.
    def test_complete_non_exist(self, app):
        target_task = 'Go jogging'
        result = app.complete_task(task=target_task)
        assert result == f"'{target_task}' not found in the list."

    # Remove a task 'Complete homework' from the list
    # Expected: 'Complete homework' removed successfully. ['DONE: Buy groceries']
    def test_remove(self, app):
        target_task = 'Complete homework'
        result = app.remove_task(task=target_task)
        assert len(app.tasks) == 1

    # Try removing a non-existent task 'Go jogging'
    # Expected: 'Go jogging' not found in the list.
    def test_remove_non_exist(self, app):
        target_task = 'Go jogging'
        result = app.remove_task(task=target_task)
        assert result == f"'{target_task}' not found in the list."
