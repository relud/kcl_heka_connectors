FROM python:2.7
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-7-jre
COPY ./requirements.txt /app/requirements.txt
RUN pip install -U 'pip>=8' && pip install --upgrade --no-cache-dir -r requirements.txt
COPY . /app
ENV CONNECTOR=file \
    DEFAULT_INITAL_POSITION_IN_STREAM=TRIM_HORIZON \
    REGION_NAME=us-east-1 \
    STREAM_NAME=mystream \
    APPLICATION_NAME=mystream-group1 \
    FILE=/app/stream.log
CMD /app/run.sh
