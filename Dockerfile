FROM ubuntu:20.04

WORKDIR /app
RUN apt-get update && apt-get install -y python
COPY ["app.py", "."]
ENTRYPOINT ["python", "app.py"]
