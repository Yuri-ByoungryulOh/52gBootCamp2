from pybo.config.default import *

SQLALCHEMY_DATABASE_URI = 'sqlite:///{}'.format(os.path.join(BASE_DIR, 'pybo.db'))
SQLALCHEMY_TRACK_MODIFICATIONS = False
SECRET_KEY = b'\xa8\x8d\xa9\xeb\xe5x.\xd5\x9c4\x8f|\xde\xe9\x19\xb5'