import os
import ast
import datetime

from projects import configs
from flask import Flask, redirect, url_for, session


def create_flask():
    conf_settings = configs.read_data('SETTINGS')
    # conf_db = configs.read_data('DB')
    # conf_mails = configs.read_data('MAILS')
    conf_files = configs.read_data('FILES')

    flask_app = Flask(__name__, instance_relative_config=False, subdomain_matching=True)
    flask_app.config['SECRET_KEY'] = conf_settings['secret_key']
    flask_app.config['DEBUG'] = conf_settings['debug']
    flask_app.config['SESSION_COOKIE_NAME'] = conf_settings['session_cookie_name']
    flask_app.config['LOGIN_DISABLED'] = False
    flask_app.config['ALLOWED_IMAGE_EXTENSIONS'] = ast.literal_eval(conf_settings['allowed_image_extensions'])
    flask_app.config['TEMP_PATH'] = conf_files['temp_path']
    flask_app.config['PHOTOS_PATH'] = conf_files['photos_path']
    flask_app.config['PERMANENT_SESSION_LIFETIME'] = datetime.timedelta(weeks=1)

    with flask_app.app_context():
        from projects.web.routes import perpus
        from projects.res.routes import res

        flask_app.register_blueprint(perpus)
        flask_app.register_blueprint(res)

        @flask_app.route('/')
        def index():
            session["logged_in"] = None
            return redirect(url_for('perpus.index'))

        return flask_app


def create_api():
    from projects.api.routes import api_app

    return api_app

