import pynamodb.constants
from pynamodb.models import Model
from pynamodb.attributes import (UnicodeAttribute, NumberAttribute,
                                 UnicodeSetAttribute, UTCDateTimeAttribute)
from datetime import datetime


from models import TodoModel

def get_all_todo_list():
    return list(TodoModel.scan())

def get_todo(id:str):
    return TodoModel.get(hash_key=id)

def create_todo(name):
    import uuid
    todo_item = TodoModel(hash_key=str(uuid.uuid4()), name = name)
    todo_item.save()
    return todo_item

def modify_todo(id, modify_contents):
    modify_item = TodoModel.get(hash_key=id)
    modify_item.name = modify_contents
    modify_item.last_modify_datetime = datetime.utcnow()
    modify_item.save()
    return modify_item

def delete_todo(id):
    delete_item = TodoModel.get(hash_key=id)
    delete_item.delete()


if __name__ == '__main__':
    # item = create_todo('asd')
    # print('create test : ', item)
    #
    # print('get test : ', get_todo(item.id))
    # modified = modify_todo(item.id, 'modify test')
    # print('modify test : ', modified)
    #
    # item2 = create_todo('qwe')
    print('get all test: ',get_all_todo_list())
    #
    # print('delete test: ', delete_todo(item.id))
