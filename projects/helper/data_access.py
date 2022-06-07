import sys

from sqlalchemy import create_engine, MetaData, Table, select
from sqlalchemy.orm import sessionmaker
from typing import Optional

# region global variable collection
# DB_TYPE = 'sqlite'
# DB_ENGINE = {DB_TYPE: 'sqlite:///{DB}?check_same_thread=true&timeout=10&mode=ro&nolock=1&uri=true'}
DB_TYPE = 'mysql+pymysql'
DB_ENGINE = {DB_TYPE: 'mysql+pymysql://{USN}:{PWD}@{HOST}/{DB}?host={HOST}?port={PORT}'}
# endregion


class WebDataAccess:
    pass


class ApiDataAccess:
    Session = None
    db_engine = None
    db_session = None
    db_metadata = None
    msg = ''

    # region For initialize
    
    def __init__(self, dbtype, duser='', dpass='', dbname='', dhost='', dport=''):
        dbtype = dbtype.lower()
        self.conn = None
        if dbtype in DB_ENGINE.keys():
            engine_url = DB_ENGINE[dbtype].format(USN=duser, PWD=dpass, DB=dbname, HOST=dhost, PORT=dport)
            self.db_engine = create_engine(engine_url, connect_args={"check_same_thread": False})
            # print(self.db_engine)
        else:
            print("DBType is not found in DB_ENGINE")

    def get_connection(self):
        # msg = ""
        try:
            self.conn = self.db_engine.connect()
            self.Session = sessionmaker(bind=self.db_engine, autocommit=False, autoflush=False)
            self.db_session = self.Session()
            self.db_metadata = MetaData()
        except Exception as ex:
            self.msg = "DB Connection: {0}".format(ex.args[0])
        return self.msg
    
    # endregion

    # def get_deviceinfo(self):
    #     di = Table('v_deviceinfo', self.db_metadata, autoload=True, autoload_with=self.db_engine)
    #     q = select(di)
    #     res_exe = self.conn.execute(q)
    #     res = res_exe.fetchall()
    #     return res

    # def get_praytime_all(self):
    #     praytime_all = Table('v_praytime_all', self.db_metadata, autoload=True, autoload_with=self.db_engine)
    #     q = select(praytime_all)
    #     res_exe = self.conn.execute(q)
    #     res = res_exe.fetchall()
    #     return res

    # def get_next_praytime(self):
    #     npy = Table('v_next_praytime', self.db_metadata, autoload=True, autoload_with=self.db_engine)
    #     q = select(npy)
    #     res_exe = self.conn.execute(q)
    #     res = res_exe.fetchall()
    #     return res

    # def get_member_all(self, uid: Optional[str] = None, member: Optional[str] = None):
    #     member_all = Table('v_member_all', self.db_metadata, autoload=True, autoload_with=self.db_engine)
    #     q = select(member_all)
    #     # q = q.where(member_all.uid.col == uid)
    #     res_proxy = self.conn.execute(q)
    #     res = res_proxy.fetchall()
    #     return res

