import pynamodb.constants
from pynamodb.models import Model
from pynamodb.attributes import (UnicodeAttribute, NumberAttribute,
                                 UnicodeSetAttribute, UTCDateTimeAttribute)
from datetime import datetime

class UserModel(Model):
    class Meta:
        billing_mode = pynamodb.constants.PAY_PER_REQUEST_BILLING_MODE
        table_name = 'yuri_user_test'
        region = 'ap-northeast-2'
    name = UnicodeAttribute(hash_key=True)
    password = UnicodeAttribute(null=False)

if not UserModel.exists():
	UserModel.create_table(wait=True,
                      billing_mode=pynamodb.constants.PAY_PER_REQUEST_BILLING_MODE)
def create_user():
    user = UserModel(name='admin', password='admin')
    user.save()
    return print('Create user Done~!')


if __name__ == '__main__':
    create_user()