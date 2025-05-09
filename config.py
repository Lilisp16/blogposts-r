import os

class Config:
    DEBUG = True
    SECRET_KEY = 'env-blog112024'
    # Usamos la variable de entorno DATABASE_URL proporcionada por Render
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL', 'sqlite:///project.db')  # Esto obtiene la URL de la base de datos de Render
    CKEDITOR_PKG_TYPE = 'full'
