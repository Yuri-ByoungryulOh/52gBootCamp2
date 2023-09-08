import pynamodb.constants
from pynamodb.models import Model
from pynamodb.attributes import (UnicodeAttribute, NumberAttribute,
                                 UnicodeSetAttribute, UTCDateTimeAttribute)
from user_models import UserModel

def get_user(name:str):
    try:
        # UserModel.get(hash_key=name)
        return UserModel.get(hash_key=name)
    except:
        raise Exception('Wrong name or password')



if __name__ == '__main__':
    get_user(name='admin')