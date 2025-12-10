FROM python:3.13-slim

WORKDIR /app

# Copy requirements first
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project
COPY . .

EXPOSE 10000

CMD ["gunicorn", "--workers=4", "--bind", "0.0.0.0:10000", "app:app"]
