from flask import Blueprint, render_template, request, redirect, url_for, session, g, make_response, flash, jsonify
from .models import User, Post, Info, ColaboradorPost, BaseBiblica, TemasEstudio
from blogr.models import Devocional  # Importa el modelo de Devocional
from blogr import db
from flask_ckeditor import CKEditor
from flask import Flask
from .auth import login_required


bp = Blueprint('home', __name__)

def get_user(id):
    user = User.query.get_or_404(id)
    return user


#lineas de codigo nuevo 13 de ciembre 2024
def get_current_user():
    """Obtiene el usuario actual desde la sesión, si está logueado."""
    if 'user_id' in session:
        return User.query.get(session['user_id'])  # Buscar al usuario por su ID almacenado en la sesión
    return None  # Si no hay un usuario logueado, retorna None





def search_posts(query):
    posts = Post.query.filter(Post.title.ilike(f'%{query}%')).all()
    return posts


@bp.route('/', methods=['GET', 'POST'])
def index():
    posts = Post.query.all()


    # Obtener el contenido del devocional desde la base de datos
    devocional = Devocional.query.first()
    contenido_devocional = devocional.contenido if devocional else "No hay devocional disponible por el momento"

    if request.method == 'POST':
        query = request.form.get('search')
        posts = search_posts(query)
        value = 'hidden'
        return render_template('index.html', posts = posts, get_user = get_user, value=value)
    
    return render_template('index.html', posts = posts, get_user = get_user,  contenido_devocional=contenido_devocional)


@bp.route('/blog/<url>')
def blog(url):
    post = Post.query.filter_by(url = url).first()
    return render_template('blog.html', post=post, get_user = get_user)








# Diccionario para almacenar el contenido editable
contenido_footer = {
    'terminos_y_condiciones': 'Contenido de Términos y Condiciones',
    'politicas_y_privacidad': 'Contenido de Política de Privacidad',
    'cookies': 'Contenido de Política de Cookies',
    'about': 'Contenido de Acerca de',
}




# Rutas para las secciones del mini-footer (ahora con contenido editable en el diccionario)
@bp.route('/terminos-y-condiciones')
def terminos_y_condiciones():
    contenido = Info.query.filter_by(seccion='terminos_y_condiciones').first()
    if contenido:
        contenido = contenido.contenido
    else:
        contenido = 'Contenido no disponible'
    return render_template('contenido_footer.html', contenido=contenido, seccion='terminos_y_condiciones', get_user=get_user)

@bp.route('/politicas-y-privacidad')
def politicas_y_privacidad():
    contenido = Info.query.filter_by(seccion='politicas_y_privacidad').first()
    if contenido:
        contenido = contenido.contenido
    else:
        contenido = 'Contenido no disponible'
    return render_template('contenido_footer.html', contenido=contenido, seccion='politicas_y_privacidad', get_user=get_user)

@bp.route('/cookies')
def cookies():
    contenido = Info.query.filter_by(seccion='cookies').first()
    if contenido:
        contenido = contenido.contenido
    else:
        contenido = 'Contenido no disponible'
    return render_template('contenido_footer.html', contenido=contenido, seccion='cookies', get_user=get_user)

@bp.route('/about')
def acerca_de():
    contenido = Info.query.filter_by(seccion='about').first()
    if contenido:
        contenido = contenido.contenido
    else:
        contenido = 'Contenido no disponible'
    return render_template('contenido_footer.html', contenido=contenido, seccion='about', get_user=get_user)

# Ruta para editar el contenido (solo para admin)
@bp.route('/editar/<seccion>', methods=['GET', 'POST'])
def editar(seccion):
    """Ruta para editar el contenido de las secciones del mini footer."""
    if 'user_id' not in session or not get_user(session['user_id']).is_admin:
        # Si no es admin, redirige al inicio o a otra página
        return redirect(url_for('home.index'))

    if request.method == 'POST':
        # Guardar el contenido editado en el diccionario
        contenido = request.form.get('contenido')

        

          # Buscar la sección correspondiente en la tabla 'info'
        info = Info.query.filter_by(seccion=seccion).first()

        if info:
            # Si la sección ya existe, actualiza el contenido
            info.contenido = contenido
        else:
            # Si la sección no existe, crea una nueva
            nuevo_info = Info(seccion=seccion, contenido=contenido)
            db.session.add(nuevo_info)

        db.session.commit()  # Guarda los cambios en la base de datos
        return redirect(url_for('home.index'))  # Redirige a la página principal

    # Recupera el contenido actual para mostrarlo en el formulario de edición
    contenido_actual = Info.query.filter_by(seccion=seccion).first()
    if contenido_actual:
        contenido_actual = contenido_actual.contenido
    else:
        contenido_actual = 'Contenido no disponible'

    return render_template('editar_contenido.html', contenido=contenido_actual, seccion=seccion, get_user=get_user)








# Ruta para mostrar el devocional (desde la base de datos)
@bp.route('/devocional')
def devocional_view():
    devocional = Devocional.query.first()
    
    if devocional:
        contenido = devocional.contenido
    else:
        contenido = "No hay devocional disponible por el momento"
    
    return contenido





# Ruta para editar el devocional (solo para administradores)
@bp.route('/editar_devocional', methods=['GET', 'POST'])
def editar_devocional():
    if request.method == 'POST':
        contenido = request.form['contenido']  # Tomamos el contenido enviado desde el formulario
        
        # Verificamos si ya existe un devocional en la base de datos
        devocional = Devocional.query.first()  # Busca el primer devocional (si existe)
        if not devocional:
            # Si no existe, lo creamos
            devocional = Devocional(contenido=contenido)
            db.session.add(devocional)
        else:
            # Si existe, actualizamos el contenido
            devocional.contenido = contenido
        
        db.session.commit()

        # Redirigimos al home.index para actualizar el modal con el contenido guardado
        return redirect(url_for('home.index'))

    # Si es un GET, mostramos el formulario para editar o crear
    devocional = Devocional.query.first()  # Verificamos si existe un devocional
    contenido = devocional.contenido if devocional else ''  # Si existe, mostramos el contenido, sino vacío
    return render_template('editar_devocional.html', contenido=contenido)






#Ruta para las bases bíblicas
@bp.route('/bases-biblicas/<subseccion>')
def bases_biblicas(subseccion):
    contenido = BaseBiblica.query.filter_by(subseccion=subseccion).first()
    if contenido:
        contenido = contenido.contenido
    else:
        contenido = 'Contenido no disponible'
    return render_template('content/vinoya_footer/bases_biblicas.html', contenido=contenido, subseccion=subseccion, get_user=get_user)





@bp.route('/editar-bases-biblicas/<subseccion>', methods=['GET', 'POST'])
def editar_bases_biblicas(subseccion):
    """Ruta para editar el contenido de las bases bíblicas."""
    if 'user_id' not in session or not get_user(session['user_id']).is_admin:
        return redirect(url_for('home.index'))

    if request.method == 'POST':
        contenido = request.form.get('contenido')
        
        # Buscar la subsección correspondiente en la tabla 'bases_biblicas'
        base = BaseBiblica.query.filter_by(subseccion=subseccion).first()

        if base:
            base.contenido = contenido  # Actualiza el contenido si ya existe
        else:
            nuevo_base = BaseBiblica(subseccion=subseccion, contenido=contenido)  # Crea un nuevo contenido
            db.session.add(nuevo_base)

        db.session.commit()
        return redirect(url_for('home.index'))

    contenido_actual = BaseBiblica.query.filter_by(subseccion=subseccion).first()
    if contenido_actual:
        contenido_actual = contenido_actual.contenido
    else:
        contenido_actual = 'Contenido no disponible'

    return render_template('content/vinoya_footer/editar_basesbb.html', contenido=contenido_actual, subseccion=subseccion, get_user=get_user)







#Ruta para las temas de estudio
@bp.route('/temas-de-estudio/<subseccion>')
def temas_estudio(subseccion):
    contenido = TemasEstudio.query.filter_by(subseccion=subseccion).first()
    if contenido:
        contenido = contenido.contenido
    else:
        contenido = 'Contenido no disponible'
    return render_template('content/vinoya_footer/temas_estudio.html', contenido=contenido, subseccion=subseccion, get_user=get_user)





@bp.route('/editar-temas-estudio/<subseccion>', methods=['GET', 'POST'])
def editar_temas_estudio(subseccion):
    """Ruta para editar el contenido de las bases bíblicas."""
    if 'user_id' not in session or not get_user(session['user_id']).is_admin:
        return redirect(url_for('home.index'))

    if request.method == 'POST':
        contenido = request.form.get('contenido')
        
        # Buscar la subsección correspondiente en la tabla 'temas_estudio'
        base = TemasEstudio.query.filter_by(subseccion=subseccion).first()

        if base:
            base.contenido = contenido  # Actualiza el contenido si ya existe
        else:
            nuevo_base = TemasEstudio(subseccion=subseccion, contenido=contenido)  # Crea un nuevo contenido
            db.session.add(nuevo_base)

        db.session.commit()
        return redirect(url_for('home.index'))

    contenido_actual = TemasEstudio.query.filter_by(subseccion=subseccion).first()
    if contenido_actual:
        contenido_actual = contenido_actual.contenido
    else:
        contenido_actual = 'Contenido no disponible'

    return render_template('content/vinoya_footer/editar_te.html', contenido=contenido_actual, subseccion=subseccion, get_user=get_user)








#aqui lo nuevo para el versiculo

