FROM python:3.6.12-slim
asdsd asd
COPY requirements.txt requirements.txt

# hadolint ignore=DL3013
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY app/ app/

RUN python3 app/model_downloader.py

ENV PYTHONPATH /app 

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]