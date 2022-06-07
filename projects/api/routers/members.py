import projects.helper.class_access as ca

from projects import configs
from fastapi import APIRouter, Depends, status, HTTPException, Query
from fastapi.responses import StreamingResponse
from typing import Optional
# region For declare api with response HTML
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
# endregion
# region For declare swagger docs offline
from fastapi.openapi.docs import (
    get_redoc_html
    , get_swagger_ui_html
    , get_swagger_ui_oauth2_redirect_html
)
from fastapi.staticfiles import StaticFiles
# endregion

from projects.helper import data_access as da
from projects.helper.data_access import ApiDataAccess
from projects.helper.class_access import ApiClassAccess

router = APIRouter(
    prefix='/members'
    , tags=['Members']
)
# region For setting swagger docs offline
# and set FastAPI(docs_url=None, redoc_url=None)
router.mount("/static", StaticFiles(directory="projects/api/static"), name="static")
# endregion
# region For setting api with response HTML
templates = Jinja2Templates(directory="projects/api/templates")
# endregion

conf_db = configs.read_data('DB')
ada = ApiDataAccess(
    da.DB_TYPE
    , duser=f"{conf_db['db_user']}"
    , dpass=f"{conf_db['db_password']}"
    , dhost=f"{conf_db['db_host']}"
    , dport=f"{conf_db['db_port']}"
    , dbname=f"{conf_db['db_sqlite']}"
)
aca = ApiClassAccess()
msg = ada.get_connection()


@router.get('/all')
async def get_all():
    return {"par": "get all data"}


