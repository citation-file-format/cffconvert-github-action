FROM python:3.8-alpine

RUN mkdir /data
COPY . /data/
WORKDIR /data

ARG CFFCONVERT_VERSION=''
RUN pip install cffconvert${CFFCONVERT_VERSION}
CMD ["cffconvert", "--help"]
