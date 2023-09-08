from flask import Flask
from flask import request
from flask_restx import Resource, Api, Namespace
from flask_jwt_extended import JWTManager
from controller import Todo, User
from flask_cors import CORS
from models import TodoModel
import pynamodb.constants
from pynamodb.models import Model
from pynamodb.attributes import (UnicodeAttribute, NumberAttribute,
                                 UnicodeSetAttribute, UTCDateTimeAttribute)


# Swagger 에서 JWT 를 사용할수 있도록 정의
authorizations = {
    'admin_token': {
        'type': 'apiKey',
        'in': 'header',
        'name': 'Authorization',
        'description': 'JWT for admin'
    },
}

# if not TodoModel.exists():
#     TodoModel.create_table(wait=True, billing_mode=pynamodb.constants.PAY_PER_REQUEST_BILLING_MODE)

app = Flask(__name__)
api = Api(app,
          title='Todo API tutorial',
          description='52g Bootcamp flask',
          doc='/swagger',
          authorizations=authorizations,
          security='admin_token',
          )
CORS(app)
app.config['JWT_SECRET_KEY']='jwt_token_test'
jwt = JWTManager(app)
api.add_namespace(Todo, '/')
api.add_namespace(User, '/user')


@app.errorhandler(Exception)
def handle_root_exception(error):
    try:
        message = error.message
    except AttributeError:
        message = str(error)
    print(f"ErrorHandler {error}")
    return {'message': message, 'error': error.__class__.__name__}, 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')