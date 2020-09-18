FROM python:3.8-alpine

WORKDIR /data
COPY . /data/
RUN pip install cffconvert

ENTRYPOINT ["cffconvert", "--help"]
