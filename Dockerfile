FROM python:3.10

# If the WORKDIR doesn't exist, it will be created
WORKDIR /workspace/app

# Relative to WORKDIR
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# Default is TCP if you don't specify a protocol.
EXPOSE 5000/tcp
EXPOSE 5000/udp

# host must set, otherwise the server will NOT publicly available
CMD ["flask", "--app=app.py", "run", "--host=0.0.0.0", "--port=5000"]

