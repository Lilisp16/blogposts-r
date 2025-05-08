import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))


from blogr import create_app, db
from blogr.models import User

app = create_app()

with app.app_context():
    # Buscar el usuario por su correo (o cualquier otro campo único)
    user_email = 'operadorpersonal0@gmail.com'  # El correo del usuario que quieres hacer administrador
    user = User.query.filter_by(email=user_email).first()  # Busca al usuario por correo

    # Si el usuario existe, asignamos el rol de administrador
    if user:
        if not user.is_admin:  # Solo actualizamos si el usuario no es ya administrador
            user.is_admin = True  # Asignamos el rol de admin
            db.session.commit()
            print(f"El usuario {user.username} ha sido promovido a administrador.")
        else:
            print(f"El usuario {user.username} ya es administrador.")
    else:
        print(f"Usuario con el correo {user_email} no encontrado.")
