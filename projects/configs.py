import os
import sys
from configparser import ConfigParser
from builtins import classmethod, print

config = ConfigParser()

basedir = os.path.abspath(os.path.dirname(__file__))


# region For Function Configuration
def create_new():
    config['SETTINGS'] = {
        'debug': 'true'
        , 'host': '0.0.0.0'
        , 'port': '300'
        , 'secret_key': '`?.RytechIndo.?'
        , 'session_cookie_name': 'RLT_PERPUS'
        , 'allowed_image_extensions': ['JPEG', 'JPG', 'JPG', 'GIF']
    }

    config['DB'] = {
        'db_sqlite': 'rlt_perpus.db'
        , 'db_host': 'localhost'
        , 'db_port': '3306'
        , 'db_name': 'rlt_perpus'
        , 'db_user': 'root'
        , 'db_password': 'abdadmin'
    }

    config['MAILS'] = {
        'mail_server': 'smtp.gmail.com'
        , 'mail_username': 'emailtester5584@gmail.com'
        , 'mail_password': '4bdull4h'
        , 'mail_port': '465'
        , 'mail_use_ssl': 'true'
        , 'mail_use_tsl': 'false'
    }

    if sys.platform == 'linux':
        config['FILES'] = {
            'temp_path': os.path.join(basedir, 'res/static/tempfile')
            , 'photos_path': os.path.join(basedir, 'res/static/photos')
        }
    elif sys.platform == 'win32':
        config['FILES'] = {
            'temp_path': os.path.join(basedir, r'res\static\tempfile')
            , 'photos_path': os.path.join(basedir, r'res\static\photos')
        }

    with open('./config.ini', 'w') as f:
        config.write(f)


def read_data(grp):
    config.read('./config.ini')
    return ClassConfig.get_config_by_option(config, grp)

# endregion


# region For Class Configuration
class ClassConfig(object):
    def __init__(self):
        pass

    @classmethod
    def get_config_by_option(cls, cfg, grp):
        retv = {}
        rh = [x for x in cfg.options(grp)]
        for h in rh:
            retv[h] = cfg.get(grp, h)

        return retv

# endregion

