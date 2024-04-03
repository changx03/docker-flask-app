FROM python:3.10

WORKDIR /workspace/app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000/tcp
EXPOSE 5000/udp

CMD ["flask", "--app=app.py", "run", "--host=0.0.0.0", "--port=5000"]

