import os

from blogr import create_app

app = create_app()

if __name__ == '__main__':
 

 # Usa el puerto proporcionado por Render y asegura que el host esté configurado correctamente
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 10000)))