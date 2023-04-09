FROM python:3.11.3-alpine3.17

WORKDIR /app

COPY requirements.txt app.py /app/

RUN apk add --no-cache build-base=0.5-r3 linux-headers=5.19.5-r0 &&\
    pip install --no-cache-dir --upgrade pip==23.0.1 &&\
    pip install --no-cache-dir psutil==5.9.4 &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

EXPOSE 8080

CMD ["python", "app.py"]