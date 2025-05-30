# Usamos imagen oficial de Python
FROM python:3.11-slim

# Establece directorio de trabajo
WORKDIR /app

# Copia archivos de requerimientos e instala dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código
COPY . .

# Expone el puerto que usará Flask
EXPOSE 5000

# Comando para iniciar tu app (ajusta si usas otro nombre)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "run:app"]
