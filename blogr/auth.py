from flask import Blueprint, render_template, request, url_for, redirect, flash, session, g
from werkzeug.security import generate_password_hash, check_password_hash

from .models import User
from blogr import db

bp = Blueprint('auth', __name__, url_prefix='/auth')


@bp.route('/register', methods = ('GET', 'POST'))
def register():

    if request.method == 'POST':
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')

        user = User(username, email, generate_password_hash(password))

        #validacion de datos
        error = None

        #Comparando nombre de usuario con los existentes
        user_email = User.query.filter_by(email = email).first()
        if user_email == None:
            db.session.add(user)
            db.session.commit()
            return redirect(url_for('auth.login'))
        else:
            error = f'El correo {email} ya esta registrado'
        
        flash(error)

    return render_template('auth/register.html')


@bp.route('/login', methods = ('GET', 'POST'))
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        #validacion de datos
        error = None
        user = User.query.filter_by(email = email).first()
        
        if user == None or not check_password_hash(user.password, password):
            error = 'Credenciales Incorrectas! nombre de usuario o contraseña no válidos'
        
        #Iniciando sesion 
        if error is None:
            session.clear()
            session['user_id'] = user.id
            return redirect(url_for('post.posts'))
        
        flash(error)

    return render_template('auth/login.html')


@bp.before_app_request
def load_logged_in_user():
    user_id = session.get('user_id')

    if user_id is None:
        g.user = None
    else:
        g.user = User.query.get_or_404(user_id)

@bp.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home.index'))

import functools

def login_required(view):
    @functools.wraps(view)
    def wrapped_view(**kwargs):
        if g.user is None:
            return redirect(url_for('auth.login'))
        return view(**kwargs)
    return wrapped_view 


# Editar Perfil
from werkzeug.utils import secure_filename

def get_photo(id):
    user = User.query.get_or_404(id)
    return user.photo # Devuelve directamente la foto del usuario


@bp.route('/profile/<int:id>', methods=('GET', 'POST'))
@login_required
def profile(id):
    user = User.query.get_or_404(id)
    photo = get_photo(id)
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')


        error = None

        # Validar el nuevo nombre de usuario y la contraseña
        if username:
            user.username = username  # Actualiza el nombre de usuario si se proporciona


        if password:
            if len(password) < 6:
                error = 'La contraseña debe contener mínimo 6 caracteres'
            else:
                user.password = generate_password_hash(password)  # Actualiza la contraseña si es válida
        
        
        if 'photo' in request.files:
            photo = request.files['photo']
            if photo and photo.filename: # Verifica que haya un archivo y que tenga un nombre
                photo.save(f'blogr/static/media/{secure_filename(photo.filename)}')
                user.photo = f'media/{secure_filename(photo.filename)}'


        if error is not None:
            flash(error)
        else:
            db.session.commit()
            flash('Los cambios se han guardado correctamente.')  # Mensaje de éxito
            return redirect(url_for('auth.profile', id = user.id))
        
      

    return render_template('auth/profile.html', user = user, photo = photo)