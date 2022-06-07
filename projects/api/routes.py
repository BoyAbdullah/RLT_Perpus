import projects.helper.class_access as ca

from projects import configs
from fastapi import FastAPI, Request
# region For declare api with response HTML
from fastapi.responses import RedirectResponse, HTMLResponse
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

from .routers import members
from projects.helper import data_access as da
from projects.helper.data_access import ApiDataAccess

api_app = FastAPI(docs_url=None, redoc_url=None)
# region For setting swagger docs offline
# and set FastAPI(docs_url=None, redoc_url=None)
api_app.mount("/static", StaticFiles(directory="projects/api/static"), name="static")
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
msg = ada.get_connection()


# region For swagger docs offline
@api_app.get("/docs", include_in_schema=False)
async def custom_swagger_ui_html():
    return get_swagger_ui_html(
        openapi_url=api_app.openapi_url,
        title=api_app.title + " - Swagger UI",
        oauth2_redirect_url=api_app.swagger_ui_oauth2_redirect_url,
        swagger_js_url="/static/swagger-ui-bundle.js",
        swagger_css_url="/static/swagger-ui.css",
    )


@api_app.get(api_app.swagger_ui_oauth2_redirect_url, include_in_schema=False)
async def swagger_ui_redirect():
    return get_swagger_ui_oauth2_redirect_html()


@api_app.get("/redoc", include_in_schema=False)
async def redoc_html():
    return get_redoc_html(
        openapi_url=api_app.openapi_url,
        title=api_app.title + " - ReDoc",
        redoc_js_url="/static/redoc.standalone.js",
    )

# endregion


@api_app.get("/", response_class=RedirectResponse, tags=['Welcome'])
async def welcome(req: Request):
    result = f"{msg}"
    return RedirectResponse(url="/perpus")


# @api_app.get("/", response_class=HTMLResponse, tags=['Welcome'])
# async def welcome(req: Request):
#     # sample: https://eugeneyan.com/writing/how-to-set-up-html-app-with-fastapi-jinja-forms-templates/
#     result = f"{msg}"
#     return templates.TemplateResponse('welcome.html', context={'request': req, 'result': result})

api_app.include_router(members.router)

