FROM python
RUN pip install Flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY sampleapp.py /home/myapp
EXPOSE 5050
CMD python3 /home/myapp/sampleapp.py
