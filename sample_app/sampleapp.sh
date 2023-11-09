#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sampleapp.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install Flask" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY sampleapp.py /home/myapp" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/sampleapp.py" >> tempdir/Dockerfile

cd tempdir
docker build -t sampleapp . 
docker run -t -d -p 5050:5050 --name samplerunning sampleapp
docker ps -a