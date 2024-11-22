SQLITE = "sqlite:///project.db"
POSTGRESQL = "postgresql+psycopg2://postgres:0761163@172.20.165.36:5432/vinoyaceite_db"

class Config:
    DEBUG = True
    SECRET_KEY = 'env-blog112024'
    SQLALCHEMY_DATABASE_URI = POSTGRESQL

    CKEDITOR_PKG_TYPE = 'full'



