import json
import gc
import calendar

from builtins import print

from flask import Blueprint, render_template, session

perpus = Blueprint('perpus', __name__, template_folder='templates', static_folder='static', url_prefix='/')


@perpus.route('/', methods=['GET', 'POST'])
def index():
    return 'Welcome to web perpustakaan'

