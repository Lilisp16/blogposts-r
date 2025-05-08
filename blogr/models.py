from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.Text, nullable=False)
    photo = db.Column(db.String(200))
    is_admin = db.Column(db.Boolean, default=False)  # Agregar el campo is_admin

    def __init__(self, username, email, password, photo = None, is_admin=False):
        self.username = username
        self.email = email
        self.password = password
        self.photo = photo
        self.is_admin = is_admin  # Inicializamos el campo is_admin

    def __repr__(self):
        return f"User: '{self.username}'"
    


class Post(db.Model):
    __tablename__ = 'posts'
    id = db.Column(db.Integer, primary_key=True)
    author = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    url = db.Column(db.String(100), unique = True, nullable=False)
    title = db.Column(db.String(100), nullable=False)
    info = db.Column(db.Text)
    content = db.Column(db.Text)
    created = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    def __init__(self, author, url, title, info, content) -> None:
        self.author = author
        self.url = url
        self.title = title
        self.info = info
        self.content = content

    def __repr__(self) -> str:
        return f'Post: {self.title}'
    




class Devocional(db.Model):
    __tablename__ = 'devocionales'
    id = db.Column(db.Integer, primary_key=True)
    contenido = db.Column(db.Text, nullable=False)  # Contenido del devocional
    # No necesitamos fecha, ya que se reemplaza cada vez que se actualiza

    def __init__(self, contenido):
        self.contenido = contenido

    def __repr__(self):
        return f'Devocional: {self.id}'
    




# Definir el modelo en tu archivo principal (por ejemplo, run.py o models.py)
class Info(db.Model):
    __tablename__ = 'info'

    id = db.Column(db.Integer, primary_key=True)
    seccion = db.Column(db.String(100), unique=True, nullable=False)
    contenido = db.Column(db.Text, nullable=False)

    def __repr__(self):
        return f'<Info {self.seccion}>'




class ColaboradorPost(db.Model):
    __tablename__ = 'colaboradores_posts'
    id = db.Column(db.Integer, primary_key=True)
    author = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)  # Relacionado con la tabla users
    titulo = db.Column(db.String(100), nullable=False)
    descripcion = db.Column(db.Text)
    enlace = db.Column(db.String(200), nullable=True)  # Enlace para video/audio
    codigo = db.Column(db.Text, nullable=True)  # Código embebido (iframe)
    pais = db.Column(db.String(50), nullable=True)  # País del colaborador
    red_social = db.Column(db.String(100), nullable=True)  # Red social del colaborador
    created = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

    def __init__(self, author, titulo, descripcion, enlace=None, codigo=None, pais=None, red_social=None):
        self.author = author
        self.titulo = titulo
        self.descripcion = descripcion
        self.enlace = enlace
        self.codigo = codigo
        self.pais = pais
        self.red_social = red_social

    def __repr__(self):
        return f'ColaboradorPost: {self.titulo}'



class BaseBiblica(db.Model):
    __tablename__ = 'bases_biblicas'

    id = db.Column(db.Integer, primary_key=True)
    subseccion = db.Column(db.String(100), unique=True, nullable=False)
    contenido = db.Column(db.Text, nullable=False)

    def __repr__(self):
        return f'<BaseBiblica {self.subseccion}>'


class TemasEstudio(db.Model):
    __tablename__ = 'temas_estudio'

    id = db.Column(db.Integer, primary_key=True)
    subseccion = db.Column(db.String(100), unique=True, nullable=False)
    contenido = db.Column(db.Text, nullable=False)

    def __repr__(self):
        return f'<TemasEstudio {self.subseccion}>'
    






