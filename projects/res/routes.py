import os

from flask import Blueprint

res = Blueprint('res', __name__, static_folder='static', static_url_path='/', url_prefix='/res')


@res.route('/', methods=['GET'])
def index():
    return 'Welcome to perpustakaan resources page.'
