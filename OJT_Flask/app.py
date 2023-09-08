from flask import Flask
from flask_restx import Api


app = Flask(__name__)

api = Api()
api.init_app(app)

if __name__ == '__main__':
    app.run(debug=True)