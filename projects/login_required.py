from functools import wraps
from flask import session, redirect, url_for, flash


def login_required(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            if session['logged_in']:
                return f(*args, **kwargs)
            else:
                flash('Session logged in has expired.')
                return redirect(url_for('perpus.sign_in'))
        else:
            session['logged_in'] = None
            return redirect(url_for('perpus.sign_in'))

    return wrap
