import json
import gc
import calendar

from builtins import print

from flask import Blueprint, render_template, session, redirect, request, jsonify, url_for
from projects.login_required import login_required

perpus = Blueprint('perpus', __name__, template_folder='templates', static_folder='static', url_prefix='/')


@perpus.route('/', methods=['GET', 'POST'])
@login_required
def index():
    return 'Welcome to web perpustakaan'


@perpus.route('/signin', methods=['GET', 'POST'])
def sign_in():
    try:

        if request.method == "POST":
            pass

        return render_template('authorize/signin.html')
    except Exception as e:
        return render_template('authorize/signin.html')

