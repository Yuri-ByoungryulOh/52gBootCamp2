from flask import Flask
from flask import request, jsonify
from flask_restx import Resource, Api, Namespace, fields, reqparse
from http import HTTPStatus
# from flask_cors import CORS
from flask_jwt_extended import JWTManager, create_access_token, jwt_required, get_jwt_identity
import pynamodb.constants
from pynamodb.models import Model
from pynamodb.attributes import (UnicodeAttribute, NumberAttribute,
                                 UnicodeSetAttribute, UTCDateTimeAttribute)
from models import TodoModel
import services
import datetime
from user_models import UserModel
from user_services import get_user
#
# todos = {}
# count = 1
Todo = Namespace('Todo',
                 description='Todo list API')
User = Namespace('User',description='User API' )
login_expect = Todo.model('Login',{'name':fields.String(description='username for login', required=True), 'password':fields.String(description='password for login', required=True)})
login_result = Todo.model('login result',{'access_token':fields.String})

todo_fields = Todo.model('Todo',{'id':fields.String(description='id fields', required=True, example='What to do?'),
                                 'name':fields.String(description='name fields', required=True, example='What is the name?'),
                                 'last_modify_datetime':fields.DateTime(description='last_modify_datetime')})
todos_fields = Todo.model('Todos',{'todos':fields.List(fields.Nested(todo_fields))})
name_fields = Todo.model('name',{'name':fields.String(description='name for modify', required=False)})
todo_delete_fields = Todo.model('delete result', {'result': fields.String(description='Delete Success!!')})

todo_filter_parser_model = reqparse.RequestParser()
todo_filter_parser_model.add_argument('name', type=str, required=False)

# todo_fields = Todo.model('Todo', {  # Model 객체 생성
#     'data': fields.String(description='a Todo', required=True, example="what to do")
# })
#
# todo_fields_with_id = Todo.inherit('Todo With ID', todo_fields, {  # todo_fields 상속 받음
#     'todo_id': fields.Integer(description='a Todo ID'),
#     'access_token':fields.String(description='Access token~')
# })


@User.route("/login")
class UserLogin(Resource):
    @User.expect(login_expect)
    @User.marshal_with(login_result)
    def post(self):
        '''Login'''

        # name = request.json.get("name")
        name = User.payload['name']
        # password = request.json.get("password")
        password = User.payload['password']

        # if name != 'admin' and password != 'admin':
        #     raise Exception('Wrong name or password')
            # return jsonify({"msg": "Bad username or password"}), 401
        user_answer = get_user(name)
        if password == user_answer.password:
            access_token = create_access_token(identity=name, expires_delta=datetime.timedelta(days=1))  # jwt 토큰 생성
            return {'access_token': access_token}, HTTPStatus.OK
        else:
            raise Exception('비밀번호가 틀립니다')
        # return jsonify(access_token=access_token)
        

    # @jwt_required()  # jwt 토큰 검증 데코레이터
    # def get(self):
    #     current_user = get_jwt_identity()  # jwt 에 연관된 사용자 정보를 가져옵니다.
    #     return jsonify(logged_in_as=current_user), 200

@Todo.route('/todos')
class TodoList(Resource):
    # @jwt_required()
    @Todo.expect(todo_filter_parser_model, validate=True)
    @Todo.marshal_with(todos_fields)
    def get(self):
        '''get all todo list'''

        filter_args = todo_filter_parser_model.parse_args()
        name = filter_args.get('name')
        todo_list = services.get_all_todo_list(name)
        return {'todos':todo_list}, HTTPStatus.OK

    # @jwt_required()
    @Todo.expect(name_fields)
    @Todo.marshal_with(todo_fields)
    def post(self):
        ''' Create Todo item '''
        name = request.json.get('name')
        # import uuid
        # id = uuid.uuid4()
        # last_post_datetime = datetime.now()
        created_item = services.create_todo(name = name)
        return created_item, HTTPStatus.CREATED


@Todo.route('/todos/<string:id>')
class TodoDetail(Resource):
    @jwt_required()
    @Todo.marshal_with(todo_fields)
    def get(self, id):
        '''Get specific todo item by the id '''
        # id = request.json.get('id')
        item = services.get_todo(id)
        return item, HTTPStatus.OK

    @jwt_required()
    @Todo.expect(name_fields)
    @Todo.marshal_with(todo_fields)
    def put(self, id):
        '''Update an item for specific id'''
        # id = request.json.get('id')
        name_changed = request.json.get('name')
        put_item = services.modify_todo(id, name_changed)
        return put_item, HTTPStatus.ACCEPTED

    # @jwt_required()
    @Todo.marshal_with(todo_delete_fields)
    def delete(self, id):
        ''' Delete the item of specific id '''
        # id = request.json.get('id')
        services.delete_todo(id)
        return {'result':'OK'}, HTTPStatus.OK

'''
@Todo.route('')
class TodoPost(Resource):
    @jwt_required()
    @Todo.doc(security='admin_token', description = 'Admin token~')
    @Todo.expect(todo_fields)
    @Todo.marshal_with(todo_fields_with_id, code=HTTPStatus.CREATED,
                       description='todo add success')
    def post(self):
        
        global count
        global todos

        idx = count
        count +=1
        todos[idx] = request.json.get('data')
        # access_token = create_access_token(identity=idx)
        return {'todo_id':idx, 'data':todos[idx]}, HTTPStatus.CREATED

@Todo.route('/<int:todo_id>')
class TodoSimple(Resource):
    @jwt_required()

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

@Todo.route('/dbCreate')
class pynamoCreateTest(Resource):
    @Todo.doc( description = 'PynamoDB test~')

    def post(self, subject):
        TodoModel_item = TodoModel('forum_name',region_key = subject)
        TodoModel_item.save()
    def get(self, region_key):
        query_list = list(TodoModel.query('Forumname', TodoModel.subject.contains(region_key)))
        # TodoModel_item = TodoModel.get('forum_name', 'forum_subject')
        return query_list
'''
