FROM python:3.11

WORKDIR /app

COPY . /app
RUN apt-get update
RUN apt-get install -y sqlite3
RUN chmod +x db/recreateDB.sh
RUN db/recreateDB.sh
RUN mkdir -p /usr/share/fonts/truetype/
RUN install -m644 Arial.ttf /usr/share/fonts/truetype/
RUN rm ./Arial.ttf
RUN pip install -r requirements.txt

ENV PYTHONPATH "${PYTHONPATH}:/app"

CMD ["python", "main.py"]
