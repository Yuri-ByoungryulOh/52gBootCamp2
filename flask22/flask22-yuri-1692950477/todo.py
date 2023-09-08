from flask import Flask
from flask import request
from flask_restx import Resource, Api, Namespace, fields
from http import HTTPStatus

# @api.route('/hello')
# class HelloWorld(Resource):
#     def get(self):
#         return {'hello':'world'}

todos = {}
count = 1
Todo = Namespace('Todo',
                 description='Todo list API')

todo_fields = Todo.model('Todo', {  # Model 객체 생성
    'data': fields.String(description='a Todo', required=True, example="what to do")
})

todo_fields_with_id = Todo.inherit('Todo With ID', todo_fields, {  # todo_fields 상속 받음
    'todo_id': fields.Integer(description='a Todo ID')
})


@Todo.route('')
class TodoPost(Resource):
    @Todo.expect(todo_fields)
    @Todo.marshal_with(todo_fields_with_id, code=HTTPStatus.CREATED,
                       description='todo add success')
    def post(self):
        '''Save todo'''
        global count
        global todos

        idx = count
        count +=1
        todos[idx] = request.json.get('data')

        return {'todo_id':idx, 'data':todos[idx]}, HTTPStatus.CREATED

@Todo.route('/<int:todo_id>')
class TodoSimple(Resource):

    def get(self, todo_id):
        print('todo_id는 : ',todo_id)
        return {
            'todo_id': todo_id,
            'data': todos[todo_id]
        }

    @Todo.expect(todo_fields)
    @Todo.marshal_with(todo_fields_with_id, code=HTTPStatus.CREATED,
                       description='todo add success')
    def put(self, todo_id):
        todos[todo_id] = request.json.get('data')
        return {
            'todo_id': todo_id,
            'data': todos[todo_id]
        }, HTTPStatus.CREATED

    def delete(self, todo_id):
        del todos[todo_id]
        return {
            "delete": "success"
        }