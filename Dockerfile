FROM python:3.13.0

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

# CMD [ "python", "./conversao-distancia.py" ]

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

EXPOSE 5000