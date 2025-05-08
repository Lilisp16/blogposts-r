from flask import Blueprint, render_template, request, flash, redirect, url_for, g
from blogr.auth import login_required
from blogr.models import ColaboradorPost, User # Solo importa los modelos que necesitas
from blogr import db



# Crear el Blueprint para colaboradores
bp = Blueprint('colaborador', __name__, url_prefix='/colaboradores')




# Ruta para la página principal de colaboradores
@bp.route('/', methods=['GET'])
def colaboradores():
    posts = ColaboradorPost.query.all()  # Obtener todos los posts de colaboradores

    # Obtener todos los usuarios
    usuarios = {user.id: user for user in User.query.all()}  # Crear un diccionario de usuarios por ID



    if not posts:  # Si no hay posts, puedes mostrar un mensaje o un post de ejemplo
        posts = [
            ColaboradorPost(
                titulo="Post de Ejemplo",
                descripcion="Este es un post de ejemplo para los colaboradores.",
                enlace="https://example.com",
                codigo="<iframe src='https://www.youtube.com/embed/example'></iframe>",
                pais="México",
                red_social="https://twitter.com/example",
                author=g.user.id
            )
        ]

         
    return render_template('content/vinoya_header/colaboradores.html', posts=posts, usuarios=usuarios)


# Ruta para agregar nuevo contenido
@bp.route('/nuevo', methods=['GET', 'POST'])
@login_required  # Esto garantiza que solo los usuarios autenticados puedan crear un post
def nuevo_contenido():
    from blogr import db  # Importar db aquí también para evitar problemas de importación
    if request.method == 'POST':
        titulo = request.form['titulo']
        descripcion = request.form['descripcion']
        enlace = request.form.get('enlace')  # Opcional
        codigo = request.form.get('codigo')  # Opcional
        pais = request.form.get('pais')  # Opcional
        red_social = request.form.get('red_social')  # Opcional

        nuevo_post = ColaboradorPost(
            titulo=titulo,
            descripcion=descripcion,
            enlace=enlace,
            codigo=codigo,
            pais=pais,
            red_social=red_social,
            author=g.user.id  # Asociamos el post al usuario logueado
        )
        db.session.add(nuevo_post)
        db.session.commit()
        flash('Nuevo contenido añadido exitosamente.')
        return redirect(url_for('colaborador.colaboradores'))  # Redirigir a la página de colaboradores
    
    return render_template('content/vinoya_header/edicion_colaborar.html')


# Ruta para editar contenido
@bp.route('/editar/<int:post_id>', methods=['GET', 'POST'])
@login_required  # Solo los usuarios logueados pueden editar
def editar_contenido(post_id):
    post = ColaboradorPost.query.get_or_404(post_id)

    # Verificar si el usuario logueado es el autor del post
    if post.author != g.user.id:
        flash('No tienes permisos para editar este contenido.')
        return redirect(url_for('colaborador.colaboradores'))

    if request.method == 'POST':
        # Actualizar los campos del post con los valores del formulario
        post.titulo = request.form['titulo']
        post.descripcion = request.form['descripcion']
        post.enlace = request.form.get('enlace')  # Opcional
        post.codigo = request.form.get('codigo')  # Opcional
        post.pais = request.form.get('pais')  # Opcional
        post.red_social = request.form.get('red_social')  # Opcional

        db.session.commit()
        flash('Post actualizado correctamente.')
        return redirect(url_for('colaborador.colaboradores'))

    return render_template('content/vinoya_header/edicion_colaborar.html', post=post)


# Ruta para eliminar un post
@bp.route('/eliminar/<int:post_id>', methods=['POST'])
@login_required  # Solo los usuarios logueados pueden eliminar
def eliminar_contenido(post_id):
    post = ColaboradorPost.query.get_or_404(post_id)

    # Verificar si el usuario logueado es el autor del post
    if post.author != g.user.id:
        flash('No tienes permisos para eliminar este contenido.')
        return redirect(url_for('colaborador.mis_colaboraciones'))

    db.session.delete(post)
    db.session.commit()
    flash('Post eliminado correctamente.')
    return redirect(url_for('colaborador.mis_colaboraciones'))





# Ruta para mostrar las colaboraciones del usuario logueado
@bp.route('/mis_colaboraciones', methods=['GET'])
@login_required  # Solo los usuarios logueados pueden ver sus colaboraciones
def mis_colaboraciones():
    posts = ColaboradorPost.query.filter_by(author=g.user.id).all()  # Filtramos por el autor (usuario logueado)
    return render_template('content/vinoya_header/mis_colaboraciones.html', posts=posts)


# Ruta para ver el contenido completo de un post
@bp.route('/ver/<int:post_id>', methods=['GET'])
@login_required  # Solo los usuarios logueados pueden ver el post completo
def ver_post(post_id):
    post = ColaboradorPost.query.get_or_404(post_id)  # Obtiene el post por ID
    return render_template('content/vinoya_header/ver_post.html', post=post)



#ruta para ver mis colaboraciones en mis post de colaboraciones  atravez de un link en el titulo
#@bp.route('/view/<int:post_id>', methods=['GET'])
#@login_required
#def view(post_id):
#    post = ColaboradorPost.query.get_or_404(post_id)  # Obtiene el post por ID
 #   return render_template('content/vinoya_header/colaboradores.html', post=post)