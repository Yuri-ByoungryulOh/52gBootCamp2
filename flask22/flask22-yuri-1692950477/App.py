from flask import Flask
from flask import request
from flask_restx import Resource, Api, Namespace

from controller import Todo


app = Flask(__name__)
api = Api(app,
          title='Todo API tutorial',
          description='52g Bootcamp flask',
          doc='/swagger',
          )
api.add_namespace(Todo, '/')



if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')