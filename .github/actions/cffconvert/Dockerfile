FROM python:3.8-alpine

RUN mkdir /data
COPY CITATION.cff /data/
WORKDIR /data

RUN pip install cffconvert
CMD ["cffconvert", "--help"]
