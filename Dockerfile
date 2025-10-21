# Imagem base
FROM python:3.11-slim

# Define o diretório de trabalho
WORKDIR /app

# Evita cache e logs interativos
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Copia dependências
COPY requirements.txt .

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o projeto
COPY . .

# Copia o wait-for-it.sh e dá permissão
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Expõe a porta do Django
EXPOSE 8000

# Comando padrão (vai ser sobrescrito no docker-compose)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
