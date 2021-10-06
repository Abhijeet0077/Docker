FROM centos

MAINTAINER ABHIJEET
RUN yum install git python2 sqlite -y

RUN git clone https://github.com/Abhijeet0077/notejam.git

WORKDIR /notejam/django

RUN pip2 install -r requirements.txt

RUN python2 ./notejam/manage.py syncdb --noinput

RUN python2 ./notejam/manage.py migrate

EXPOSE 8000

CMD ["python2", "./notejam/manage.py", "runserver", "0.0.0.0:8000"]
