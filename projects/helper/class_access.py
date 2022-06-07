from builtins import classmethod
from typing import Optional
from pydantic import BaseModel


class FlaskClassAccess(object):
    def __init__(self):
        pass


class ApiClassAccess(object):
    def __init__(self):
        pass

    # region tester
    
    # endregion
    

# region For API Class
# region For Authentication & Token
class Token(BaseModel):
    access_token: str
    token_type: str


class TokenData(BaseModel):
    username: Optional[str] = None


# endregion
class Members(BaseModel):
    uid: Optional[str] = None
    uuid: Optional[str] = None
    name: Optional[str] = None
    title: Optional[str] = None

    class Config():
        orm_mode = True

# endregion

