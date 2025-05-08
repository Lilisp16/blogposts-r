from flask import Flask, session, g
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate  # Importa Flask-Migrate
from blogr.models import db, User  # Aquí se importa el objeto db desde models.py





#db = SQLAlchemy()

def create_app():

    # Crear aplicacion de flask
    app = Flask(__name__)

    app.config.from_object('config.Config')
    db.init_app(app) # inicializar la base de datos



     # Configuración de Flask-Migrate
    migrate = Migrate(app, db)  # Agregar esta línea



    from flask_ckeditor import CKEditor
    ckeditor = CKEditor(app)

    import locale
    locale.setlocale(locale.LC_ALL, 'es_ES.utf8')



    # Registrar vistas
    from blogr import home
    app.register_blueprint(home.bp)

    from blogr import auth
    app.register_blueprint(auth.bp)

    from blogr import post
    app.register_blueprint(post.bp)


  
     

    # IMPORTA Y REGISTRA EL BLUEPRINT DE COLABORADOR
    from blogr.colaborador import bp as colaborador_bp  # Importa el Blueprint de colaboradores
    app.register_blueprint(colaborador_bp)

  

     # Context processor para que `get_user` esté disponible en todos los templates
    @app.context_processor
    def inject_user():
        """Este context processor agrega la función get_user a todos los templates."""
        if 'user_id' in session:
             user = User.query.get(session['user_id'])  # Buscar al usuario por su ID almacenado en la sesión
             return {'get_user': lambda user_id: User.query.get(user_id)}  # Devuelve la función get_user
        return {}

     # Context Processor para que `get_user` esté disponible en todos los templates
    @app.before_request
    def load_logged_in_user():
        user_id = session.get('user_id')
        if user_id is not None:
            g.user = User.query.get(user_id)
        else:
            g.user = None

    # Procesar la base de datos y crear las tablas si no existen
    with app.app_context():
        db.create_all()

    return app







   

