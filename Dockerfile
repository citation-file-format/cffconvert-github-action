FROM python:3.8-alpine

WORKDIR /data
COPY . /data/
RUN pip install cffconvert==1.3.3
ENTRYPOINT ["cffconvert"]
