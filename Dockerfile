FROM python:3.6.12-slim

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY app/ app/

RUN python3 app/model_downloader.py

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]