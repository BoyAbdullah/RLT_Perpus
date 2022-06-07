#!D:\2DEV_PYTHON_FLASK\rlt_perpus\venv\Scripts\python.exe

import os
import ast

import uvicorn

from projects import configs
from fastapi.middleware.wsgi import WSGIMiddleware
from projects import create_flask, create_api

if __name__ == '__main__':
    if not os.path.exists('./config.ini'):
        configs.create_new()

    flask_app = create_flask()
    api_app = create_api()
    api_app.mount("/perpus", WSGIMiddleware(flask_app))

    conf_settings = configs.read_data('SETTINGS')
    uvicorn.run(api_app, host=conf_settings['host'], port=int(conf_settings['port']))

