from flask import Flask, session, g
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from blogr.models import db, User
from flask_ckeditor import CKEditor
import locale
import os

# db = SQLAlchemy()  # Ya lo importaste desde blogr.models

def create_app():
    print("🛠 Iniciando create_app()")
    app = Flask(__name__)

    # Configuración base
    app.config.from_object('config.Config')

    # 🛠️ Asegurar compatibilidad con SQLAlchemy si DATABASE_URL empieza con postgres://
    db_url = os.getenv('DATABASE_URL')
    if db_url and db_url.startswith('postgres://'):
        db_url = db_url.replace('postgres://', 'postgresql://', 1)
        app.config['SQLALCHEMY_DATABASE_URI'] = db_url

    # Inicializar extensiones
    db.init_app(app)
    migrate = Migrate(app, db)
    ckeditor = CKEditor(app)

    # ⚠️ Manejamos locales solo si están disponibles
    try:
        locale.setlocale(locale.LC_ALL, 'es_ES.utf8')
    except locale.Error:
        print("⚠️ Locale es_ES.utf8 no disponible. Usando configuración por defecto.")

    # Registrar blueprints
    from blogr import home
    app.register_blueprint(home.bp)

    from blogr import auth
    app.register_blueprint(auth.bp)

    from blogr import post
    app.register_blueprint(post.bp)

    from blogr.colaborador import bp as colaborador_bp
    app.register_blueprint(colaborador_bp)

    # Context processors
    @app.context_processor
    def inject_user():
        if 'user_id' in session:
            return {'get_user': lambda user_id: User.query.get(user_id)}
        return {}

    @app.before_request
    def load_logged_in_user():
        user_id = session.get('user_id')
        g.user = User.query.get(user_id) if user_id else None

    # ⚠️ Esta línea puede causar problemas en producción si la base aún no existe
    # with app.app_context():
    #     db.create_all()

    print("✅ Flask app creada correctamente")
    return app
