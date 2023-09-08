import pytest
from todo import TodoApp


# Initialize the app, use fixture
@pytest.fixture(scope='session')
def app():
    return TodoApp()


class TestTodo:
    # Add task 'Buy groceries' to the list
    # Expected: 'Buy groceries' added successfully.
    # 힌트
    # def test_add_new_task_1(...):
    #     ... # call add_task function
    #     ... # check 'Buy groceries' is in the results of view_tasks() function
    def test_add_new_task_1(self, app):
        app.add_task("Buy groceries")
        assert "Buy groceries" in app.view_tasks()


    # Add task 'Complete homework' to the list
    # Expected: 'Complete homework' added successfully.
    def test_add_new_task_2(self, app):
        app.add_task("Complete homework")
        assert "Complete homework" in app.view_tasks()


    # Add task 'Buy groceries' that already exists in the list
    # Expected: 'Buy groceries' already exists in the list.
    def test_add_already_existing_task(self, app):
        count = len(app.view_tasks())
        app.add_task("Buy groceries")
        assert len(app.view_tasks()) == count   # Make sure count is not changed



    # View current tasks
    # Expected: ['Buy groceries', 'Complete homework']
    def test_view_task(self, app):
        assert app.view_tasks() == ['Buy groceries', 'Complete homework']

    # Mark a task 'Buy groceries' as complete
    # Expected: 'Buy groceries' marked as complete. ['DONE: Buy groceries', 'Complete homework']
    def test_mark_as_complete(self, app):
        app.complete_task("Buy groceries")
        assert app.view_tasks() == ['DONE: Buy groceries', 'Complete homework']

    
    # Try marking a non-existent task 'Go jogging' as complete
    # Expected: 'Go jogging' not found in the list.
    def test_mark_non_existent_task_as_complete(self, app):
        count = len(app.view_tasks())
        app.complete_task("Go jogging")
        assert len(app.view_tasks()) == count


    # Remove a task 'Complete homework' from the list
    # Expected: 'Complete homework' removed successfully. ['DONE: Buy groceries']

    def test_remove_task(self, app):
        app.remove_task("Complete homework")
        assert app.view_tasks() == ['DONE: Buy groceries']

    # Try removing a non-existent task 'Go jogging'
    # Expected: 'Go jogging' not found in the list.
    def test_remove_non_existent_task(self, app):
        tasks_before = app.view_tasks()[:]
        app.remove_task("Go jogging")
        assert app.view_tasks() == tasks_before    # Make sure the result is identical to the tasks before remove
